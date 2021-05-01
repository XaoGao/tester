import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

export const alert = {
  error(message) {
    return toast.error(message, defaultSettings);
  },
  success(message) {
    return toast.success(message, defaultSettings)
  }
}


const defaultSettings = {
  position: "top-right",
  autoClose: 5000,
  hideProgressBar: false,
  closeOnClick: true,
  pauseOnHover: true,
  draggable: true,
  progress: undefined,
};
