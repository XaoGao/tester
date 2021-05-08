import React, { useState } from "react";
import Button from "@material-ui/core/Button";
import CreateForm from "../modal/CreateForm";

const CreateButton = (props) => {
  const [open, setOpen] = useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };
  return (
    <>
      <Button onClick={handleClickOpen} color="primary">
        Добавить
      </Button>
      <CreateForm open={open} handleClose={handleClose} handle={props.create} title="Добавить"/>
    </>
  );
};
export default CreateButton;
