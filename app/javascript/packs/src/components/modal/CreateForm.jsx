import React, { useState } from "react";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import Checkbox from "@material-ui/core/Checkbox";
import { alert } from "../../utils/toast";

const CreateForm = (props) => {
  const [name, setName] = useState('');
  const [sortLevel, setSortLevel] = useState('');
  const handleClick = () => {
    props.handleClose();
    props
      .handle(name, sortLevel, false)
      .then((_) => {
        alert.success(`${name} добавлен`);
      })
      .catch((error) => {
        alert.error(error.message);
      });
  };
  return (
    <Dialog
      open={props.open}
      onClose={props.handleClose}
      aria-labelledby="form-dialog-title"
    >
      <DialogTitle id="form-dialog-title">{props.title}</DialogTitle>
      <DialogContent>
        <TextField
          label="Наименование"
          fullWidth
          defaultValue={name}
          onChange={(e) => {
            setName(e.target.value);
          }}
        />
        <TextField
          label="Позиция"
          fullWidth
          defaultValue={sortLevel}
          onChange={(e) => {
            setSortLevel(e.target.value);
          }}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={() => handleClick()} color="primary">
          Сохранить
        </Button>
        <Button onClick={props.handleClose} color="primary">
          Выйти
        </Button>
      </DialogActions>
    </Dialog>
  );
};
export default CreateForm;
