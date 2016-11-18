Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7qto-0007Kz-60
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 21:40:47 +0000
Received: by mail-wm0-x243.google.com with SMTP id a20so10326014wme.2
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 13:40:23 -0800 (PST)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: IPQ4019 Firmware: board-2.bin vs board.bin
Date: Fri, 18 Nov 2016 22:40:19 +0100
Message-ID: <2015959.yVS5oqEmyf@debian64>
In-Reply-To: <CA+BoTQn9GqW8iHdNJ02NvDQpTOYk8REvgyChaa4NL7vv0O6M=A@mail.gmail.com>
References: <3020314.NNveBmB38o@debian64> <2201471.3r8NqtoCOn@debian64>
 <CA+BoTQn9GqW8iHdNJ02NvDQpTOYk8REvgyChaa4NL7vv0O6M=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2015959.RVLl82n7uo"
Content-Transfer-Encoding: 7Bit
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

This is a multi-part message in MIME format.

--nextPart2015959.RVLl82n7uo
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, November 18, 2016 8:12:58 PM CET Michal Kazior wrote:
> On 18 November 2016 at 19:40, Christian Lamparter
> <chunkeey@googlemail.com> wrote:
> > On Friday, November 18, 2016 6:25:24 PM CET Michal Kazior wrote:
> >> On 18 November 2016 at 17:46, Christian Lamparter
> >> <chunkeey@googlemail.com> wrote:
> >> > I've acquired a IPQ4019 Router (Asus RT-AC58U). And It has a IPQ4019-SoC.
> >> > I'm currently in the process of porting it to LEDE. I can report that the
> >> > router is booting and I got the ath10k to work with 4.8.8 +
> >> > LEDE's compat-wireless (2016-10-08-1).
> >> >
> >> > Now, I ran across a small discrepancy with the provided firmware for
> >> > the IPQ4019. From the ath10k's driver prospective it seems that the
> >> > board-2.bin provided on github[0] has the wrong filename:
> >> >
> >> > ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
> >> > ath10k_ahb a000000.wifi: Falling back to user helper
> >> > firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
> >> > ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
> >> > ath10k_ahb a000000.wifi: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
> >> > ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00044 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 b9833652
> >> > ath10k_ahb a000000.wifi: failed to fetch board data for bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-devn
> >>
> >> As far as I remember QCA4019 is supposed to used bmi chip
> >> identification instead of pci ids for board files. For some reason the
> >> driver uses pci ids on your device. Can you load ath10k_core with
> >> debug_mask=0xffffff3f and post results, please? I recall OpenWRT was
> >> messing with board file logic with its downstream patches and I
> >> wouldn't be surprised if LEDE keeps on doing that as well.
> >
> > I've attached the logs you want for both cases (board.bin and board2.bin).
> > LEDE does indeed patch ath10k [0]. But as far as I can tell, LEDE just
> > adds a extra path to supply the caldata [1] via request_firmware.
> 
> Patch [1] is wrong. I find it frustrating OpenWRT/LEDE doesn't try to
> work with upstream on ixing these things right.
Ok, 
> 
> You seem to have cal data file (I assume you extracted it from device
> flash partition). In this case there's no need for board file.
Yes, it's from the "Factory" partition.
 
> Just in case - are you sure it's complete cal data and pre-cal? I
> recall qca4019 have the following flow: pre-cal -> otp get chip id ->
> get proper board file -> populate via otp (see commit 3d9195ea19e48).
That I don't know. I've attached the cal for the a0000000.wifi (2G I think).
Since this is the first device I have and I found very little information
about it (the vendor source drop isn't helpful either since it uses the
propitiatory qca driver).
Also, I haven't seen what pre-cal would look like? Do you have any
examples? (It seems that it's pretty small since it can be supplied via DT).

> If it's really cal then I think a patch will be required (but this
> needs to land in upstream this time). Something like this is probably
> fine (didn't test!):
> 
>---
>...
>---

Thanks, I had to change ar->cal_data to ar->cal_file and add a few
guards around ar->normal_mode_fw.board since it's no longer loaded
and causes the thing to crash otherwise...

With this patch I no longer need the board.bin at all and the device
also initializes.

(Is the attached patch enough? Or are there any other hidden 
->board->data users that are not checked?)

Regards,
Christian

---
--- a/drivers/net/wireless/ath/ath10k/core.c	2016-11-18 21:58:52.479123559 +0100
+++ b/drivers/net/wireless/ath/ath10k/core.c	2016-11-18 22:15:12.701003098 +0100
@@ -654,6 +654,11 @@ static int ath10k_core_get_board_id_from
 	u8 board_id, chip_id;
 	int ret;
 
+	if (ar->cal_file) {
+		ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot skipping board id, cal data present\n");
+		return 0;
+	}
+
 	address = ar->hw_params.patch_load_addr;
 
 	if (!ar->normal_mode_fw.fw_file.otp_data ||
@@ -1073,6 +1078,11 @@ static int ath10k_core_fetch_board_file(
 	char boardname[100];
 	int ret;
 
+	if (ar->cal_file) {
+		ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot skipping board file, cal data present\n");
+		return 0;
+	}
+
 	ret = ath10k_core_create_board_name(ar, boardname, sizeof(boardname));
 	if (ret) {
 		ath10k_err(ar, "failed to create board name: %d", ret);
--- a/drivers/net/wireless/ath/ath10k/debug.c	2016-10-08 13:44:55.000000000 +0200
+++ b/drivers/net/wireless/ath/ath10k/debug.c	2016-11-18 22:04:57.399832350 +0100
@@ -169,8 +169,8 @@ void ath10k_debug_print_board_info(struc
 	ath10k_info(ar, "board_file api %d bmi_id %s crc32 %08x",
 		    ar->bd_api,
 		    boardinfo,
-		    crc32_le(0, ar->normal_mode_fw.board->data,
-			     ar->normal_mode_fw.board->size));
+		    ar->normal_mode_fw.board ? crc32_le(0, ar->normal_mode_fw.board->data,
+			     ar->normal_mode_fw.board->size) : 0);
 }
 
 void ath10k_debug_print_boot_info(struct ath10k *ar)
@@ -2314,10 +2314,14 @@ static ssize_t ath10k_debug_fw_checksums
 			 "codeswap\t\t%08x\n",
 			 crc32_le(0, ar->normal_mode_fw.fw_file.codeswap_data,
 				  ar->normal_mode_fw.fw_file.codeswap_len));
-	len += scnprintf(buf + len, buf_len - len,
+
+	if (ar->normal_mode_fw.board) {
+		len += scnprintf(buf + len, buf_len - len,
 			 "board-N.bin\t\t%08x\n",
 			 crc32_le(0, ar->normal_mode_fw.board->data,
 				  ar->normal_mode_fw.board->size));
+	}
+
 	len += scnprintf(buf + len, buf_len - len,
 			 "board\t\t\t%08x\n",
 			 crc32_le(0, ar->normal_mode_fw.board_data,
---

--nextPart2015959.RVLl82n7uo
Content-Disposition: attachment; filename="cal-ahb-a000000.wifi.bin"
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream; name="cal-ahb-a000000.wifi.bin"

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
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFBwkLDQ8RExUXGRsdH///////////
//////////////j4+Pj4+Pj4+Pj4+Pj4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAQEAAAABAQICAgEB
AQICAwMFBQUGBgYGBgYGBge4mHBIIMiCUCgUJCQjJCQjJSIhISMiISIiVgQIAAEAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAkJB2dlRUTEY4AAsLBgYAAAAAAAA4KSUjIiIfAAAAFAf2+P7+FQAA
ADgpJSMiIiIfAAAdDAcCBAT9AAAAAAABAJCQdnZUVExGOAALCwYGAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAcKxwjqwAAABwf46scH+OrAAAAAAsLCwsLCwsLCws
LCwsLCoqKCYsLCwsLCwqKigmLCwsLCwsKiooJiwsLCwsLCoqKCYsLCwsLCwqKigmLCwsLCwsKioo
JiwsLCwsLCoqKCYsLCwsLCwqKigmKioqKioqKiomJioqKioqKioqJiYqKioqKioqKiYmKioqKioq
KiomJioqKioqKioqJiYqKioqKioqKiYmKioqKioqKiomJioqKioqKioqJiYAAAAAAAAAAAAAAAAA
AAAAAAAAABEeERFBHkERMR4xEXB1en+EiY6TonB1en+EiY6TonB1en+EiY6TogA8PDw8PDw8PCY8
PDw8PDw8PCY8PDw8PDw8PCY8PDw8PDw8PCY8PDw8PDw8PCY8PDw8PDw8PCYSHhIuEswSERoeGi4a
TBAeEBEYHkIeQi5CzEIRSh5KLkpMQB5AEUgeMh4yLjLMMhE6HjouOkwwHjAROB5wdXp/hImOk5id
onB1en+EiY6TmJ2icHV6f4SJjpOYnaIAICoqKioqKioqKiAgKioqKioqKioqICAqKioqKioqKiog
ICoqKioqKioqKiAgKioqKioqKioqICAqKioqKioqKiogICoqKioqKioqKiAiLCwsLCwsLCwsICIs
LCwsLCwsLCwgIiwsLCwsLCwsLCAgKioqKioqKioqICAqKioqKioqKiogICoqKioqKioqKiAgKioq
KioqKioqICAqKioqKioqKiogICoqKioqKioqKiAgKioqKioqKioqICIsLCwsLCwsLCwgIiwsLCws
LCwsLCAiLCwsLCwsLCwsICAqKioqKioqKiogICoqKioqKioqKiAgKioqKioqKioqICAqKioqKioq
KiogICoqKioqKioqKiAgKioqKioqKioqICAqKioqKioqKiogIiwsLCwsLCwsLCAiLCwsLCwsLCws
ICIsLCwsLCwsLCwgEx4T7hMRGx4bLhtMQx5D7kMRSx5LLktMMx4z7jMROx47LjtMen+JjpOYen+J
jpOYen+JjpOYHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQg
HqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQkJCQgHqQk
JCQgAAAAAHCJnaxwiZ2scImdrHCJnawlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUl
JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUl////////////////////////////////////
//////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeXl5eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAHl5eXkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAB5eXl5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
eXl5eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHl5eXkAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB5eXl5AAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeXl5eQAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHl5eXkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAB5eXl5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAeXl5eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AHl5eXkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB5eXl5AAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeXl5eQAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHl5eXkAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB5eXl5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAeXl5eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAHl5eXkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAB5eXl5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeXl5eQAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHl5eXkAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB5eXl5AAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeXl5eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAHl5eXkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAB5eXl5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAeXl5eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHl5eXkA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB5eXl5AAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeXl5eQAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHl5eXkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAB5eXl5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAeXl5eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAHl5eXkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAXMhcRHxJHMkcRTxI3MjcRPxIICAgICAgICAgAUmKSorLDUmKSorLDUmKS
orLDPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
FzIXER8SRzJHEU8SNzI3ET8SCQkJCQkJCQkJAFJikqKyw1JikqKyw1JikqKywzw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABMXGiMtM0AAExcaHiMoLTNTFxo
eIygtM1MXGh4jKC0zSMjIiIgHh4cGRQjIyAgHhwaGBYUIyMiIiAeHhwZFCMjICAeHBoYFhQjIyIi
IB4eHBkUIyMgIB4cGhgWFCMjIiIgHh4cGRQjIyAgHhwaGBYUIyMiIiAeHhwZFCMjICAeHBoYFhQj
IyIiIB4eHBkUIyMgIB4cGhgWFCMjIiIgHh4cGRQjIyAgHhwaGBYUIyMiIiAeHhwZFCMjICAeHBoY
FhQiIiIiIB4eHBkYIiIiIB4cGhgWFCIiIiIgHh4cGRgiIiIgHhwaGBYUIiIiIiAeHhwZGCIiIiAe
HBoYFhQiIiIiIB4eHBkYIiIiIB4cGhgWFCIiIiIgHh4cGRgiIiIgHhwaGBYUIiIiIiAeHhwZGCIi
IiAeHBoYFhQiIiIiIB4eHBkYIiIiIB4cGhgWFCIiIiIgHh4cGRgiIiIgHhwaGBYUISEhISAfHhwZ
FyEhIR8eHBoYFhQhISEhIB8eHBkXISEhHx4cGhgWFCEhISEgHx4cGRchISEfHhwaGBYUISEhISAf
HhwZFyEhIR8eHBoYFhQhISEhIB8eHBkXISEhHx4cGhgWFCEhISEgHx4cGRchISEfHhwaGBYUISEh
ISAfHhwZFyEhIR8eHBoYFhQhISEhIB8eHBkXISEhHx4cGhgWFAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACUBxEAQDQAACgIEQA8ADwEQAARAMrDKYAAADEAIxEA
ACAQAAAiEgAAIhIAACISAAA8ADEAQgUp0EIHKdFCBynQQgcp0EIHKdAQBBEAB4AFIKgAMQDe0OoA
19fqAN7Q6gDe0OoA3tDqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAA/7AMFAIEZABwiQAAAQIECJeXl5ehoaGhAAAAAAAAAAC4uLi4l5eXl6GhoaEAAAAAAAAAALi4
uLiXl5eXoaGhoQAAAAAAAAAAuLi4uJeXl5ehoaGhAAAAAAAAAAC4uLi4TFhcaIygtMlMWFxojKC0
yUxYXGiMoLTJTFhcaIygtMknJiUkJyYlJCcmJSQnJiUkJyYlJCcmJSQnJiUkJyYlJCcmJSQnJiUk
JyYlJCcmJSQnJiUkJyYlJCcmJSQnJiUkJyYlJCcmJSQnJiUkJyYlJCcmJSQnJiUkJyYlJCcmJSQn
JiUkJyYlJCcmJSQnJiUkJyYlJCcmJSQnJiUkJyYlJBAeEBEYHkAeQBFIHjAeMBE4HkxQVFhcYGRo
jJCUmJygpKissLS4vcHFyc1MUFRYXGBkaIyQlJicoKSorLC0uL3BxcnNTFBUWFxgZGiMkJSYnKCk
qKywtLi9wcXJzQA8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDwAEh4SLhJMEogSERoeGi4aTEIeQi5CTEKIQhFKHkouSkwyHjIuMkwyiDIROh46LjpM
TFBUWFxgZGiMkJSYnKCkqKywtLi9wcXJzUxQVFhcYGRojJCUmJygpKissLS4vcHFyc1MUFRYXGBk
aIyQlJicoKSorLC0uL3BxcnNADw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PBMeE+4TERse
Gy4bTEMeQ+5DEUseSy5LTDMeM+4zETseOy47TE5WXmaOlp6mrra/x05WXmaOlp6mrra/x05WXmaO
lp6mrra/xzw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PBT+FBEc
HhwuHEwUAET+RBFMHkwuTExEADT+NBE8HjwuPEw0AFJikqKyw1JikqKyw1JikqKywzw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PBYyFhEeEkYyRhFOEjYy
NhE+ElqaWppamjw8PDw8PDw8PDw8PDw8PDw8PPIABwDuAAIAAAAAAAAAAAADAAAAPFUGAQAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////8=


--nextPart2015959.RVLl82n7uo
Content-Disposition: attachment; filename="ath10k_ahb_new.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="ath10k_ahb_new.txt"

[  495.654859] ath10k_ahb a000000.wifi: ahb probe
[  495.655735] ath10k_ahb a000000.wifi: irq: 174
[  495.658275] ath10k_ahb a000000.wifi: mem: 0xceb00000 mem_len: 2097152 gcc mem: 0xced80000 tcsr_mem: 0xcee00000
[  495.666514] ath10k_ahb a000000.wifi: boot waiting target to initialise
[  495.672749] ath10k_ahb a000000.wifi: boot target indicator 80000002
[  495.679105] ath10k_ahb a000000.wifi: boot target initialised
[  495.685585] ath10k_ahb a000000.wifi: boot ahb hif power up
[  495.691382] ath10k_ahb a000000.wifi: axi bus halted
[  495.839536] ath10k_ahb a000000.wifi: core 0 reset done
[  495.840050] ath10k_ahb a000000.wifi: boot waiting target to initialise
[  495.843628] ath10k_ahb a000000.wifi: boot target indicator 80000002
[  495.850247] ath10k_ahb a000000.wifi: boot target initialised
[  495.856325] ath10k_ahb a000000.wifi: boot init ce src ring id 0 entries 16 base_addr ce6e1000
[  495.862334] ath10k_ahb a000000.wifi: boot ce dest ring id 1 entries 512 base_addr ce6e3000
[  495.870872] ath10k_ahb a000000.wifi: boot ce dest ring id 2 entries 128 base_addr ce6e6000
[  495.878812] ath10k_ahb a000000.wifi: boot init ce src ring id 3 entries 32 base_addr ce6e8000
[  495.887483] ath10k_ahb a000000.wifi: boot init ce src ring id 4 entries 8192 base_addr ce6ea000
[  495.895771] ath10k_ahb a000000.wifi: boot ce dest ring id 5 entries 512 base_addr ce6fc000
[  495.904254] ath10k_ahb a000000.wifi: boot init ce src ring id 7 entries 2 base_addr cea9c000
[  495.912577] ath10k_ahb a000000.wifi: boot ce dest ring id 7 entries 2 base_addr cea9e000
[  495.921171] ath10k_ahb a000000.wifi: boot ce dest ring id 8 entries 128 base_addr ceaa0000
[  495.940564] ath10k_ahb a000000.wifi: bmi get target info
[  495.940858] ath10k_ahb a000000.wifi: Hardware name qca4019 hw1.0 version 0x1000000
[  495.945517] ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
[  495.952519] ath10k_ahb a000000.wifi: Falling back to user helper
[  496.063280] firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
[  496.064632] ath10k_ahb a000000.wifi: found calibration file ath10k/cal-ahb-a000000.wifi.bin
[  496.071409] ath10k_ahb a000000.wifi: trying fw api 5
[  496.083239] ath10k_ahb a000000.wifi: found fw version 10.4-3.2.1-00047
[  496.084668] ath10k_ahb a000000.wifi: found fw timestamp 1479300476
[  496.091166] ath10k_ahb a000000.wifi: found otp image ie (4582 B)
[  496.097191] ath10k_ahb a000000.wifi: found fw image ie (359358 B)
[  496.103693] ath10k_ahb a000000.wifi: found firmware features ie (2 B)
[  496.109484] ath10k_ahb a000000.wifi: Enabling feature bit: 3
[  496.115834] ath10k_ahb a000000.wifi: Enabling feature bit: 12
[  496.121726] ath10k_ahb a000000.wifi: Enabling feature bit: 13
[  496.127108] ath10k_ahb a000000.wifi: Enabling feature bit: 14
[  496.132942] ath10k_ahb a000000.wifi: features
[  496.138573] ath10k_ahb a000000.wifi: 00000000: 08 70 00 00                                      .p..
[  496.143026] ath10k_ahb a000000.wifi: found fw ie wmi op version 6
[  496.152184] ath10k_ahb a000000.wifi: found fw ie htt op version 4
[  496.158072] ath10k_ahb a000000.wifi: found fw code swap image ie (150415 B)
[  496.164202] ath10k_ahb a000000.wifi: using fw api 5
[  496.170971] ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
[  496.175789] ath10k_ahb a000000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 1 testmode 1
[  496.190344] ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00047 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 68f59ec5
[  496.193330] ath10k_ahb a000000.wifi: boot did not find a pre calibration file, try DT next: -11
[  496.205378] ath10k_ahb a000000.wifi: unable to load pre cal data from DT: -2
[  496.214021] ath10k_ahb a000000.wifi: could not load pre cal data: -2
[  496.221305] ath10k_ahb a000000.wifi: boot skipping board file, cal data present
[  496.227609] ath10k_ahb a000000.wifi: board_file api 0 bmi_id N/A crc32 00000000
[  496.235650] ath10k_ahb a000000.wifi: bmi start
[  496.241996] ath10k_ahb a000000.wifi: bmi write address 0x400800 length 4
[  496.246469] ath10k_ahb a000000.wifi: bmi read address 0x400810 length 4
[  496.253420] ath10k_ahb a000000.wifi: bmi write address 0x400810 length 4
[  496.259719] ath10k_ahb a000000.wifi: bmi write address 0x400844 length 4
[  496.266592] ath10k_ahb a000000.wifi: bmi write address 0x400904 length 4
[  496.273340] ath10k_ahb a000000.wifi: bmi write address 0x4008bc length 4
[  496.280004] ath10k_ahb a000000.wifi: boot did not find a pre calibration file, try DT next: -11
[  496.286640] ath10k_ahb a000000.wifi: unable to load pre cal data from DT: -2
[  496.295154] ath10k_ahb a000000.wifi: failed to load pre cal data: -2
[  496.302387] ath10k_ahb a000000.wifi: pre cal download procedure failed, try cal file: -2
[  496.308685] ath10k_ahb a000000.wifi: bmi read address 0x4008ac length 4
[  496.316877] ath10k_ahb a000000.wifi: boot push board extended data addr 0x0
[  496.323141] ath10k_ahb a000000.wifi: bmi read address 0x400854 length 4
[  496.330144] ath10k_ahb a000000.wifi: bmi write address 0xc0000 length 12064
[  496.356144] ath10k_ahb a000000.wifi: bmi write address 0x400858 length 4
[  496.356336] ath10k_ahb a000000.wifi: boot cal file downloaded
[  496.361971] ath10k_ahb a000000.wifi: boot using calibration mode file
[  496.367567] ath10k_ahb a000000.wifi: boot found firmware code swap binary
[  496.374033] ath10k_ahb a000000.wifi: bmi write address 0x417010 length 208
[  496.380833] ath10k_ahb a000000.wifi: boot uploading firmware image ced02228 len 359358
[  496.387540] ath10k_ahb a000000.wifi: bmi fast download address 0x1234 buffer 0xced02228 length 359358
[  496.395487] ath10k_ahb a000000.wifi: bmi lz stream start address 0x1234
[  496.404906] ath10k_ahb a000000.wifi: bmi lz data buffer 0xced02228 length 359356
[  497.609009] ath10k_ahb a000000.wifi: bmi lz data buffer 0xc705de1c length 4
[  497.609071] ath10k_ahb a000000.wifi: bmi lz stream start address 0x0
[  497.614851] ath10k_ahb a000000.wifi: bmi write address 0x400814 length 4
[  497.621443] ath10k_ahb a000000.wifi: pci hif get default pipe
[  497.628066] ath10k_ahb a000000.wifi: pci hif map service
[  497.633742] ath10k_ahb a000000.wifi: bmi done
[  497.639106] ath10k_ahb a000000.wifi: htt tx max num pending tx 2500
[  497.644176] ath10k_ahb a000000.wifi: htt rx ring size 2048 fill_level 1023
[  497.649477] ath10k_ahb a000000.wifi: boot ahb hif start
[  497.658009] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 20
[  497.663736] ath10k_ahb a000000.wifi: Target ready! transmit resources: 2 size:1792
[  497.667450] ath10k_ahb a000000.wifi: pci hif map service
[  497.674833] ath10k_ahb a000000.wifi: boot htc service 'Control' ul pipe 0 dl pipe 1 eid 0 ready
[  497.680468] ath10k_ahb a000000.wifi: boot htc service 'Control' eid 0 TX flow control disabled
[  497.688727] ath10k_ahb a000000.wifi: boot htc service HTT Data does not allocate target credits
[  497.697392] ath10k_ahb a000000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c4af03c0
[  497.706166] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x80b3dc8c len 16 n_items 1
[  497.713402] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c4af03c0
[  497.721271] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 20
[  497.729169] ath10k_ahb a000000.wifi: HTC Service HTT Data connect response: status: 0x0, assigned ep: 0x1
[  497.734916] ath10k_ahb a000000.wifi: pci hif map service
[  497.744515] ath10k_ahb a000000.wifi: boot htc service 'HTT Data' ul pipe 4 dl pipe 5 eid 1 ready
[  497.749721] ath10k_ahb a000000.wifi: boot htc service 'HTT Data' eid 1 TX flow control disabled
[  497.758459] ath10k_ahb a000000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c0852840
[  497.767093] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x8537150c len 16 n_items 1
[  497.774229] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c0852840
[  497.782206] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 20
[  497.790128] ath10k_ahb a000000.wifi: HTC Service WMI connect response: status: 0x0, assigned ep: 0x2
[  497.795808] ath10k_ahb a000000.wifi: pci hif map service
[  497.804933] ath10k_ahb a000000.wifi: boot htc service 'WMI' ul pipe 3 dl pipe 2 eid 2 ready
[  497.810398] ath10k_ahb a000000.wifi: ath10k_htc_build_tx_ctrl_skb: skb c0bf8cc0
[  497.818260] ath10k_ahb a000000.wifi: HTC is using TX credit flow control
[  497.825595] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x8480498c len 20 n_items 1
[  497.832736] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 0 skb c0bf8cc0
[  497.840281] ath10k_ahb a000000.wifi: pci rx ce pipe 2 len 284
[  497.847947] ath10k_ahb a000000.wifi: htc rx completion ep 2 skb c57b2f00
[  497.853883] ath10k_ahb a000000.wifi: testmode event wmi cmd_id 32768 skb c57b2f00 skb->len 272
[  497.860655] ath10k_ahb a000000.wifi: 00000000: 00 00 00 01 2f 00 00 00 03 00 00 00 02 00 00 00  ..../...........
[  497.869047] ath10k_ahb a000000.wifi: 00000010: 05 00 00 00 08 00 00 00 07 00 00 00 07 00 00 00  ................
[  497.879412] ath10k_ahb a000000.wifi: 00000020: 09 00 00 00 04 00 00 00 01 00 00 00 0a 00 00 00  ................
[  497.889557] ath10k_ahb a000000.wifi: 00000030: 08 00 00 00 0d 00 00 00 07 00 00 00 0e 00 00 00  ................
[  497.899713] ath10k_ahb a000000.wifi: 00000040: 06 00 00 00 07 00 00 00 01 00 00 00 00 00 00 00  ................
[  497.909870] ath10k_ahb a000000.wifi: 00000050: 00 00 00 00 02 00 00 00 5b 08 00 00 b2 59 99 33  ........[....Y.3
[  497.920025] ath10k_ahb a000000.wifi: 00000060: fa ff 00 00 3f 00 00 00 3f 00 00 00 00 00 00 00  ....?...?.......
[  497.930183] ath10k_ahb a000000.wifi: 00000070: 3f 00 00 00 07 00 00 00 c0 0b 00 00 0c 68 00 00  ?............h..
[  497.940339] ath10k_ahb a000000.wifi: 00000080: 08 09 00 00 ac 0a 00 00 30 13 00 00 d4 17 00 00  ........0.......
[  497.950495] ath10k_ahb a000000.wifi: 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 07 00 00 00  ................
[  497.960650] ath10k_ahb a000000.wifi: 000000a0: 01 00 00 00 d0 02 00 00 02 00 00 00 00 00 00 00  ................
[  497.970807] ath10k_ahb a000000.wifi: 000000b0: 02 00 00 00 00 01 00 00 0c 00 00 00 01 00 00 00  ................
[  497.980962] ath10k_ahb a000000.wifi: 000000c0: 03 00 00 00 00 04 00 00 0c 00 00 00 01 00 00 00  ................
[  497.991121] ath10k_ahb a000000.wifi: 000000d0: 04 00 00 00 00 10 00 00 0c 00 00 00 01 00 00 00  ................
[  498.001274] ath10k_ahb a000000.wifi: 000000e0: 06 00 00 00 00 0c 00 00 00 00 00 00 23 00 00 00  ............#...
[  498.011432] ath10k_ahb a000000.wifi: 000000f0: 07 00 00 00 00 18 00 00 00 00 00 00 01 00 00 00  ................
[  498.021588] ath10k_ahb a000000.wifi: 00000100: 05 00 00 00 fc 07 00 00 02 00 00 00 00 00 00 00  ................
[  498.031785] ath10k_ahb a000000.wifi: wmi svc: 00000000: 08 00 00 00 07 00 00 00 07 00 00 00 09 00 00 00  ................
[  498.041908] ath10k_ahb a000000.wifi: wmi svc: 00000010: 04 00 00 00 01 00 00 00 0a 00 00 00 08 00 00 00  ................
[  498.052755] ath10k_ahb a000000.wifi: wmi svc: 00000020: 0d 00 00 00 07 00 00 00 0e 00 00 00 06 00 00 00  ................
[  498.063689] ath10k_ahb a000000.wifi: wmi svc: 00000030: 07 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  ................
[  498.074629] ath10k_ahb a000000.wifi: wmi mem_req_id 1 num_units 0 num_unit_info 2 unit size 720 actual units 529
[  498.085915] ath10k_ahb a000000.wifi: wmi mem_req_id 2 num_units 1 num_unit_info 12 unit size 256 actual units 52
[  498.095831] ath10k_ahb a000000.wifi: wmi mem_req_id 3 num_units 1 num_unit_info 12 unit size 1024 actual units 52
[  498.106016] ath10k_ahb a000000.wifi: wmi mem_req_id 4 num_units 1 num_unit_info 12 unit size 4096 actual units 52
[  498.116302] ath10k_ahb a000000.wifi: wmi mem_req_id 6 num_units 35 num_unit_info 0 unit size 3072 actual units 35
[  498.126456] ath10k_ahb a000000.wifi: wmi mem_req_id 7 num_units 1 num_unit_info 0 unit size 6144 actual units 1
[  498.136615] ath10k_ahb a000000.wifi: wmi mem_req_id 5 num_units 0 num_unit_info 2 unit size 2044 actual units 529
[  498.147806] ath10k_ahb a000000.wifi: wmi event service ready min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b vht_cap 7
[  498.160584] ath10k_ahb a000000.wifi: firmware 10.4-3.2.1-00047 booted
[  498.182800] ath10k_ahb a000000.wifi: wmi ext resource config host type 1 firmware feature bitmap 00000032
[  498.189306] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  498.198823] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x8096d340 len 20 n_items 1
[  498.205662] ath10k_ahb a000000.wifi: wmi chunk 0 len 380880 requested, addr 0x85600000
[  498.213657] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  498.213675] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  498.213729] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c0a7eb40
[  498.233402] ath10k_ahb a000000.wifi: wmi chunk 1 len 13312 requested, addr 0x85494000
[  498.241222] ath10k_ahb a000000.wifi: wmi chunk 2 len 53248 requested, addr 0x80970000
[  498.249169] ath10k_ahb a000000.wifi: wmi chunk 3 len 212992 requested, addr 0x85400000
[  498.257019] ath10k_ahb a000000.wifi: wmi chunk 4 len 107520 requested, addr 0x84420000
[  498.264830] ath10k_ahb a000000.wifi: wmi chunk 5 len 6144 requested, addr 0x84c4a000
[  498.272730] ath10k_ahb a000000.wifi: wmi chunk 6 len 1081276 requested, addr 0x85000000
[  498.280625] ath10k_ahb a000000.wifi: wmi init 10.4
[  498.288318] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  498.293224] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x8096d100 len 280 n_items 1
[  498.300155] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c0a7ec00
[  498.328212] ath10k_ahb a000000.wifi: pci rx ce pipe 5 len 28
[  498.328257] ath10k_ahb a000000.wifi: htt rx, msg_type: 0xF
[  498.332987] ath10k_ahb a000000.wifi: htt chan change freq 2412 phymode 11ng-ht20
[  498.338305] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  498.345846] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  498.351515] ath10k_ahb a000000.wifi: pci rx ce pipe 2 len 40
[  498.357779] ath10k_ahb a000000.wifi: htc rx completion ep 2 skb c57b1000
[  498.363546] ath10k_ahb a000000.wifi: testmode event wmi cmd_id 32769 skb c57b1000 skb->len 28
[  498.370235] ath10k_ahb a000000.wifi: 00000000: 00 00 00 01 03 00 00 00 70 4d 7b 11 9f f8 00 00  ........pM{.....
[  498.378618] ath10k_ahb a000000.wifi: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00              ............
[  498.388903] ath10k_ahb a000000.wifi: wmi event ready sw_version 16777216 abi_version 3 mac_addr 70:4d:7b:11:9f:f8 status 0
[  498.398782] ath10k_ahb a000000.wifi: WMI vdev create: id 0 type 2 subtype 0 macaddr 70:4d:7b:11:9f:f8
[  498.409731] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  498.418812] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84986380 len 32 n_items 1
[  498.425622] ath10k_ahb a000000.wifi: WMI vdev delete id 0
[  498.425644] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c568d840
[  498.426040] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  498.426057] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  498.452510] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  498.458827] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84986240 len 16 n_items 1
[  498.465653] ath10k_ahb a000000.wifi: wmi echo value 0x0ba991e9
[  498.465811] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  498.465827] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  498.465882] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c568d300
[  498.491323] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  498.499106] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84986100 len 16 n_items 1
[  498.506102] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c568d0c0
[  498.514023] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  498.521710] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  498.527602] ath10k_ahb a000000.wifi: pci rx ce pipe 2 len 16
[  498.533942] ath10k_ahb a000000.wifi: htc rx completion ep 2 skb c57b10c0
[  498.539672] ath10k_ahb a000000.wifi: testmode event wmi cmd_id 36865 skb c57b10c0 skb->len 4
[  498.546325] ath10k_ahb a000000.wifi: 00000000: e9 91 a9 0b                                      ....
[  498.554781] ath10k_ahb a000000.wifi: wmi event echo value 0x0ba991e9
[  498.563951] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84985fc0 len 12 n_items 1
[  498.570277] ath10k_ahb a000000.wifi: pci rx ce pipe 5 len 12
[  498.577917] ath10k_ahb a000000.wifi: htt rx, msg_type: 0x0
[  498.583633] ath10k_ahb a000000.wifi: htt target version 2.2
[  498.588856] ath10k_ahb a000000.wifi: htt frag desc bank cmd
[  498.594599] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84985e80 len 56 n_items 1
[  498.599934] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84985d40 len 48 n_items 1
[  498.607871] ath10k_ahb a000000.wifi: htt h2t aggr cfg msg amsdu 3 ampdu 64
[  498.615923] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84985c00 len 11 n_items 1
[  498.622324] ath10k_ahb a000000.wifi: wmi disable pktlog
[  498.622367] ath10k_ahb a000000.wifi: pci rx ce pipe 5 len 16
[  498.622380] ath10k_ahb a000000.wifi: htt rx, msg_type: 0x15
[  498.641056] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  498.643898] ath10k_ahb a000000.wifi: pci rx ce pipe 2 len 128
[  498.643913] ath10k_ahb a000000.wifi: htc rx completion ep 2 skb c57b1180
[  498.643928] ath10k_ahb a000000.wifi: testmode event wmi cmd_id 32770 skb c57b1180 skb->len 116
[  498.643944] ath10k_ahb a000000.wifi: 00000000: 00 00 00 00 f4 09 00 00 2e 58 fc 17 03 00 00 00  .........X......
[  498.643957] ath10k_ahb a000000.wifi: 00000010: 1e 00 00 00 4c 09 00 00 4c 09 00 00 00 00 00 00  ....L...L.......
[  498.643970] ath10k_ahb a000000.wifi: 00000020: f4 09 00 00 2e 58 fc 17 12 00 00 00 1e 00 00 00  .....X..........
[  498.643983] ath10k_ahb a000000.wifi: 00000030: 4c 09 00 00 4c 09 00 00 00 00 00 00 f4 09 00 00  L...L...........
[  498.643996] ath10k_ahb a000000.wifi: 00000040: 2e 58 fc 17 45 00 00 00 1e 00 00 00 4c 09 00 00  .X..E.......L...
[  498.644008] ath10k_ahb a000000.wifi: 00000050: 4c 09 00 00 00 00 00 00 f4 09 00 00 2e 58 fc 17  L............X..
[  498.644021] ath10k_ahb a000000.wifi: 00000060: 67 00 00 00 1e 00 00 00 4c 09 00 00 4c 09 00 00  g.......L...L...
[  498.644034] ath10k_ahb a000000.wifi: 00000070: 00 00 00 00                                      ....
[  498.644046] ath10k_ahb a000000.wifi: wmi event debug mesg len 116
[  498.754699] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x84985ac0 len 12 n_items 1
[  498.760703] ath10k_ahb a000000.wifi: htt-ver 2.2 wmi-op 6 htt-op 4 cal file max-sta 512 raw 0 hwcrypto 1
[  498.760850] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  498.760866] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  498.760913] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c568df00
[  498.789922] ath10k_ahb a000000.wifi: wmi disable pktlog
[  498.797713] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 1)
[  498.802962] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x85349740 len 12 n_items 1
[  498.809907] ath10k_ahb a000000.wifi: htc ep 2 consumed 1 credits (total 0)
[  498.809918] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c4823000
[  498.809962] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  498.832361] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 1)
[  498.838258] ath10k_ahb a000000.wifi: pci tx item 0 paddr 0x85349600 len 16 n_items 1
[  498.844832] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 16
[  498.852435] ath10k_ahb a000000.wifi: htc ep 2 got 1 credits (total 2)
[  498.858046] ath10k_ahb a000000.wifi: pci rx ce pipe 1 len 12
[  498.864411] ath10k_ahb a000000.wifi: boot suspend complete
[  498.870168] ath10k_ahb a000000.wifi: boot ahb hif stop
[  498.870190] ath10k_ahb a000000.wifi: ath10k_htc_notify_tx_completion: ep 2 skb c48230c0
[  498.887324] ath10k_ahb a000000.wifi: boot hif power down
[  498.888435] ath: EEPROM regdomain: 0x0
[  498.894023] ath: EEPROM indicates default country code should be used
[  498.897528] ath: doing EEPROM country->regdmn map search
[  498.904074] ath: country maps to regdmn code: 0x3a
[  498.909443] ath: Country alpha2 being used: US
[  498.914016] ath: Regpair used: 0x3a


--nextPart2015959.RVLl82n7uo
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--nextPart2015959.RVLl82n7uo--
