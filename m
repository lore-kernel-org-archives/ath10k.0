Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTSMJ-0007VN-9o
 for ath10k@lists.infradead.org; Tue, 17 Jan 2017 11:55:29 +0000
Received: by mail-wm0-x22b.google.com with SMTP id c206so219037327wme.0
 for <ath10k@lists.infradead.org>; Tue, 17 Jan 2017 03:55:05 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Subject: QCA4019: calibration files and board files
Date: Tue, 17 Jan 2017 12:54:52 +0100
Message-ID: <1591748.RGYhBEn8I1@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5614110465045497883=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, Michal Kazior <michal.kazior@tieto.com>

--===============5614110465045497883==
Content-Type: multipart/signed; boundary="nextPart2078622.sth3NPZDit"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2078622.sth3NPZDit
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I've just	tested LEDE-IPQ40XX [1] after the official open QSDK 1.1.3 [2] was
not able to boot on an ap.dk01.1-c1-like device. This seemed to work
exceptionally well (the device basically worked after the first build) but I
got a little suspicious when looking at the code which it uses for getting the
wifi devices up and running.

Spoiler: My actual questions are at the end of the mail.


Info about how wifi device (cal) is initialized in LEDE-IPQ40xx
===============================================================

The device by default has two things (please correct me when I missed
something):

 * two QCA4019 EEPROM  sections (12064 bytes each) in the 0:ART partition
   - starting at 4096 -> will be stored as ath10k/pre-cal-ahb-a000000.wifi.bin
   - starting at 20480 -> will be stored as ath10k/pre-cal-ahb-a800000.wifi.bin

 * board-2.bin file from https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0
   - contains 6 specific subsections (16 and 17 are used)
     + bus=ahb,bmi-chip-id=0,bmi-board-id=16
     + bus=ahb,bmi-chip-id=0,bmi-board-id=17
     + bus=ahb,bmi-chip-id=0,bmi-board-id=18
     + bus=ahb,bmi-chip-id=0,bmi-board-id=19
     + bus=ahb,bmi-chip-id=0,bmi-board-id=20
     + bus=ahb,bmi-chip-id=0,bmi-board-id=21

What confuses me now is that Christian Lamparter created a new package [3]
which creates special board-2.bin files for each device. It is currently
unknown how they were created (simply using the pre-cal files?) and why this
would be necessary. At least in the past (QCA988x) it was not necessary to
overwrite the board(-2).bin with an AP specific version. Either board.bin +
OTP or the wifi EEPROM (cal files, ...) did the job.

My question is therefore, which steps are now necessary to get the QCA4019
devices working correctly. Looking at ath10k_download_cal_data seems to
suggest:

 * ath10k_core_pre_cal_config is tried at first:
   - get data from pre-cal files (ART?) or DT under qcom,ath10k-pre-calibration-data
   - get board ids (see values from the board-2.bin sections) via OTP
   - ath10k_download_and_run_otp will start when everything looks good:
     + first try to use the board data (from board-2.bin)
       !!! from board-2.bin and not pre-cal !!!!
     + tries to run OTP
   - QCA4019 wifi should now be ready and no extra steps for cal/board data
     are required
 * if pre-cal didn't work then it falls back to the standard routine
    + ath10k_download_cal_file -> loads cal file to board and then stops
    + ath10k_download_cal_dt -> loads cal DT entry to board and then stops
    + ath10k_download_cal_eeprom -> loads cal EEPROM data to board and then stops
    + ath10k_download_and_run_otp -> loads board(-2).bin data to board, executes
      OTP and then stops (see last step of ath10k_core_pre_cal_config)

I have absolutely no information how this is supposed to work and whether the
pre-cal data will really be preserved somehow by the firmware when
ath10k_core_pre_cal_config loads the AP vendor neutral board-2.bin data and
executes the OTP. But the ath10k commit [4] introducing it, seems to describe
this process quite well. Now there is only the problem - why are there
modified board-2.bin files in LEDE-IPQ40xx [3] which are generated in an
unknown way and seem to be important to get 5GHz working.



Info about how wifi device (cal) is initialized in QSDK 1.1.3
=============================================================

Lets have a look at the QSDK 1.1.3 output:

    [   13.407078] ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
    [   13.407122] ath10k_ahb a000000.wifi: Firmware failed to load from user helper
    [   13.416797] ath10k_ahb a000000.wifi: Direct firmware load for ath10k/cal-ahb-a000000.wifi.bin failed with error -2
    [   13.423883] ath10k_ahb a000000.wifi: Firmware failed to load from user helper
    [   13.435634] ath10k_ahb a000000.wifi: Firmware loaded from user helper succesfully
    [   13.441352] ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
    [   13.448922] ath10k_ahb a000000.wifi: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
    [   13.462938] ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00039 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 dda04a00
    [   13.524630] ath10k_ahb a000000.wifi: Firmware loaded from user helper succesfully
    [   13.525478] ath10k_ahb a000000.wifi: board_file api 2 bmi_id 0:16 crc32 9e6ce62c
    [   14.835890] ath10k_ahb a000000.wifi: htt-ver 2.2 wmi-op 6 htt-op 4 cal file max-sta 512 raw 0 hwcrypto 1


Here we can see that the loading seems to work differently. It doesn't stop
after pre-cal (which should send board-2.bin data + execute OTP). Problem
here seems to be that there is no helper script at all to generate the
(pre-)calibration files.

Instead we now have a patch called
a00-0058-ath10k-add-qca40xx-mtd-caldata-download-sup.patch [5]. Or to say it
in the (slightly modified) words of Michael Kazior: "I find it frustrating QCA
doesn't try to work with upstream on fixing these things right." [7] ;)

But what we see here is that ART is used for the pre-cal-* data (see
ath10k_core_probe_fw) and then also used again in ath10k_download_cal_data
(instead of the board data). The board-2.bin data doesn't seem to be
downloaded via ath10k_download_and_run_otp. Even when the comment in this
patch describes it (before jumping out of function without doing the mentioned
steps):

    +		/* Download board data and run otp. This step will make sure
    +		 * the target derives final version of board specific info
    +		 * from board data content and caldata content downloaded in
    +		 * previous steps.
    +		*/
    +		goto done;

At least we know now that the pre-cal-* data is really the one from the ART
partition. But we don't know why the board-2.bin data is never send to the HW.
And also not why the otp_exe_param is never executed via ath10k_bmi_execute.
But it is interesting that it was executed before a QCA988x change was
introduced [6]. So I am guessing that it is just a(nother) bug in the open
QSDK and the board-2.bin data should be send to the device and OTP
(otp_exe_param) should have been executed.


Questions
=========

Which therefore brings me back to the initial questions:

 * Is it known what was modified in the board data and why the board-2.bin
   from ath10k/QSDK open don't "work"? At least there must be something
   essential when each vendor ships completely different versions (according
   to the LEDE-IPQ40xx package [3]).
 * How were the board-2.bin files from Christian generated
   (not the tool to generate the TLV sections of board-2.bin. But the input
    files used for the actual board data sections).
 * Is the QCA4019 ath10k board data + cal loading order really correct:
   - load ART data as pre-cal-* to device
   - execute BMI_PARAM_GET_EEPROM_BOARD_ID
   - load correct board data from board-2.bin to device
   - execute bmi_otp_exe_param

Kind regards,
	Sven


[1] https://github.com/chunkeey/LEDE-IPQ40XX
[2] caf_AU_LINUX_QSDK_RELEASE_DATE_R1_TARGET_ALL.5.0.639.021.xml from
    git://codeaurora.org/tools/repo.git (yes, I gave up trying to
    understand their different version numbers)
[3] https://github.com/chunkeey/LEDE-IPQ40XX/commit/901d6d3c38063b2fd9ded3e6ae6f21f5ced15f01
[4] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3d9195ea19e4854d7daa11688b01905e244aead9
[5] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/a00-0058-ath10k-add-qca40xx-mtd-caldata-download-sup.patch?id=a1feeac0aad9c817035577b32f9ded77dd23cb31
[6] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/commit/?id=cd78cb8fcbc28af3e538743177f106ec8c5fe295
[7] https://www.mail-archive.com/ath10k@lists.infradead.org/msg05896.html
--nextPart2078622.sth3NPZDit
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlh+BgwACgkQXYcKB8Em
e0ZLmQ/+J8SgOv+anbKfz0NcZ5JG0JO44K2gE+d1hOp2bdCOqMjlZ/RMXyOIOB41
cMdMypD4CPBY+nQsjiBZ80Vd4025FdSe2cOk4JP/nB/NVoqk7JmH1abXY89h3U1t
J0brrSb6hIucsoF77ZaYpDuk0f5b3A9WxqTgUFcE/3nSrLFY/DjkE7jAMsOeC7J1
mThaSLlm/qn+UYtSOqYYyl0sDtK9lfXyXjopYOgwaexRJGAJnNeb4UoeOhu6MEjX
poC06qPO4lEzVRTYi817o71cXBYF5bxjj/cr5dbVPOFAmaxFfCMtL2lPf/ySEqFF
6Zq8synBDlsFrly13mEq3+YYptpuxPEwJ/ddzD4F16nRcPx5Bjo8r1W83cI+piUh
vY0OWfhe5B33bRUKINLDGtSLxdQlBqf2f/Umtq60G2RvIbZzLtVPH4IGbtYX1u7x
rh+XDZzDjJ2ZPm5DFVvs7ap2eYKtRBeoVF6ZEbBpI9ijoDfO6ndHxFIpXneHNanL
Q9T/7z6cNTpwt6Ji/7hjI5YCLPMfkeG0jfQjoU13V+FcOcmttOtQv5MMFYczqTxg
jGaoOfd0zNM3157BXipmxIgAmfh+G/dQ4jb39hC3aSZJ6UNB+uw2GOqc+JN+nnMV
JMIW6LlG2MXDkbDyj4ZcVKoGqzYmIkX/VvATInlMbNlNa8ogVlo=
=A5tn
-----END PGP SIGNATURE-----

--nextPart2078622.sth3NPZDit--



--===============5614110465045497883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5614110465045497883==--
