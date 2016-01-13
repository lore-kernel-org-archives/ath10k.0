Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJMb1-0001tn-2x
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 14:40:23 +0000
Received: by mail-wm0-x235.google.com with SMTP id f206so298467478wmf.0
 for <ath10k@lists.infradead.org>; Wed, 13 Jan 2016 06:40:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56965AA3.2020708@detter.com>
References: <56965AA3.2020708@detter.com>
Date: Wed, 13 Jan 2016 15:40:01 +0100
Message-ID: <CA+BoTQmTaQnEqtogURerBCLi9aRfPHUCbVPbKDuCJaJ3nUpQKg@mail.gmail.com>
Subject: Re: [ath10K] QCA6174 firmware
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Detter <john@detter.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 13 January 2016 at 15:09, John Detter <john@detter.com> wrote:
> Hello everyone,
>
> I recently bought a laptop (Samsung) that has a Qualcomm Atheros QCA6174
> card. I have tried using the firmware from both kvalo's repo and the
> official linux-firmware repo and neither of them have worked. I am running a
> fresh Ubuntu 15.10 installation (Linux 4.2.0). I have also tried installing
> Ubuntu Gnome 15.10 with the mainline kernel build (Linux 4.4.0) and that
> didn't work either. The laptop I'm using does have a button on the keyboard
> to enable/disable the wifi and I'm not sure if it's causing an issue or not.
> I have checked rfkill list and there is neither a hard nor soft block on the
> wlan. I'm not really sure where to go from here, any help would be much
> appreciated!
>
> Thanks for your time,
>
> - John
>
> Directory structure when I tried firmware from linux-firmware:
>
> root@Ubuntu-15:/lib/firmware/ath10k/QCA6174/hw3.0# pwd
> /lib/firmware/ath10k/QCA6174/hw3.0
> root@Ubuntu-15:/lib/firmware/ath10k/QCA6174/hw3.0# ls -al
> total 744
> drwxr-xr-x 4 root root   4096 Jan 13 07:41 .
> drwxr-xr-x 4 root root   4096 Jan 13 07:39 ..
> -rw-r--r-- 1 root root   8124 Jan 13 07:38 board.bin
> lrwxrwxrwx 1 root root     11 Jan 13 07:41 board-pci-168c:003e:144d:412f.bin
> -> ./board.bin
> -rw-r--r-- 1 root root 733784 Jan 13 07:39 firmware-4.bin
> lrwxrwxrwx 1 root root     16 Jan 13 07:40 firmware-5.bin ->
> ./firmware-4.bin
>
> Directory structure when I tried kvalo's firmware:
>
> root@Ubuntu-15:/lib/firmware/ath10k/QCA6174/hw3.0# pwd
> /lib/firmware/ath10k/QCA6174/hw3.0
> root@Ubuntu-15:/lib/firmware/ath10k/QCA6174/hw3.0/new# ls -al
> total 844
> drwxr-xr-x 2 root root   4096 Jan 13 07:31 .
> drwxr-xr-x 4 root root   4096 Jan 13 07:41 ..
> -rw-r--r-- 1 root root  24692 Jan 13 07:17 board-2.bin
> -rw-r--r-- 1 root root   8124 Jan 13 07:17 board.bin
> lrwxrwxrwx 1 root root     11 Jan 13 07:17 board-pci-168c:003e:144d:412f.bin
> -> ./board.bin
> -rw-r--r-- 1 root root 733784 Jan 13 07:17
> firmware-4.bin_WLAN.RM.2.0-00180-QCARMSWPZ-1
> lrwxrwxrwx 1 root root     44 Jan 13 07:18 firmware-5.bin ->
> firmware-4.bin_WLAN.RM.2.0-00180-QCARMSWPZ-1
> -rw-r--r-- 1 root root  79801 Jan 13 07:17
> notice.txt_WLAN.RM.2.0-00180-QCARMSWPZ-1
>
>
> Here is the relevant part of my dmesg log:
>
> jdetter@Ubuntu-15:~$ dmesg | grep ath10
> [    6.789911] ath10k_pci 0000:3b:00.0: enabling device (0000 -> 0002)
> [    6.791752] ath10k_pci 0000:3b:00.0: pci irq msi-x interrupts 8 irq_mode
> 0 reset_mode 0
> [    7.009504] ath10k_pci 0000:3b:00.0: Direct firmware load for
> ath10k/cal-pci-0000:3b:00.0.bin failed with error -2
> [    9.145690] ath10k_pci 0000:3b:00.0: qca6174 hw3.2 (0x05030000,
> 0x00340aff, 168c:003e:144d:412f) fw WLAN.RM.2.0-00180-QCARMSWPZ-1 api 5 htt
> 3.26 wmi 4 cal otp max_sta 32
> [    9.145694] ath10k_pci 0000:3b:00.0: debug 0 debugfs 1 tracing 1 dfs 0
> testmode 0
> [   10.144947] ath10k_pci 0000:3b:00.0: suspend timed out - target pause
> event never came
> [   13.219455] ath10k_pci 0000:3b:00.0 wlp59s0: renamed from wlan0
> [   18.479782] ath10k_pci 0000:3b:00.0: failed to enable dynamic BW: -11
> [   21.479376] ath10k_pci 0000:3b:00.0: could not suspend target (-11)
> [   29.770121] ath10k_pci 0000:3b:00.0: failed to enable dynamic BW: -11
> [   32.769665] ath10k_pci 0000:3b:00.0: could not suspend target (-11)

Firmware command timeouts (-11) suggest that wrong board file was used
to boot the device.

The currently available board-2.bin doesn't seem to include your
device (168c:003e:144d:412f). You can list them with:

; strings board-2.bin | grep vendor
bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3361m
bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3362m
bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3363m

Was this run on 4.4 or 4.2?

The board-2.bin support was added in 4.4. Prior to this the driver
would try to load the board-pci-xxx. files. You can:
 a) scream louder and complain to your card vendor and/or qualcomm
 b) use pre-4.4 kernel, get windows driver, extract .inf and eeprom
files from it, look for the one that matches your device
(168c:003e:144d:412f) and use it as board-pci-168c:003e:144d:412f.bin


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
