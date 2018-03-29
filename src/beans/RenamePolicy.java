package beans;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class RenamePolicy implements FileRenamePolicy {

	public File rename(File original) {
		original.getParentFile();
		System.out.println(original.getName());
		System.out.println("rename..");
		//===============================
		File dir=original.getParentFile();
		String fname=original.getName();
		int idx=fname.lastIndexOf(".");
		String ext=fname.substring(idx);
		File c=new File(dir,System.currentTimeMillis()+ext);
		//==========================
		return new File(original.getParentFile(),System.currentTimeMillis()+".jpg");
	/*	if(original.exists()) {
			return new File(original.getParentFile(), "1-"+original.getName());
		}else {
			return original;
		}
		*/
	}

}
