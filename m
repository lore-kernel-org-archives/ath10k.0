Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7obB-0000ti-Fk
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 19:13:22 +0000
Received: by mail-wm0-x22f.google.com with SMTP id a197so57424271wmd.0
 for <ath10k@lists.infradead.org>; Fri, 18 Nov 2016 11:13:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2201471.3r8NqtoCOn@debian64>
References: <3020314.NNveBmB38o@debian64>
 <CA+BoTQ=6x=4V8=1-Co4quZ3UDTzDT_Q=iP6R-pSQd1qkesMDSg@mail.gmail.com>
 <2201471.3r8NqtoCOn@debian64>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Fri, 18 Nov 2016 20:12:58 +0100
Message-ID: <CA+BoTQn9GqW8iHdNJ02NvDQpTOYk8REvgyChaa4NL7vv0O6M=A@mail.gmail.com>
Subject: Re: IPQ4019 Firmware: board-2.bin vs board.bin
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 18 November 2016 at 19:40, Christian Lamparter
<chunkeey@googlemail.com> wrote:
> On Friday, November 18, 2016 6:25:24 PM CET Michal Kazior wrote:
>> On 18 November 2016 at 17:46, Christian Lamparter
>> <chunkeey@googlemail.com> wrote:
>> > I've acquired a IPQ4019 Router (Asus RT-AC58U). And It has a IPQ4019-SoC.
>> > I'm currently in the process of porting it to LEDE. I can report that the
>> > router is booting and I got the ath10k to work with 4.8.8 +
>> > LEDE's compat-wireless (2016-10-08-1).
>> >
>> > Now, I ran across a small discrepancy with the provided firmware for
>> > the IPQ4019. From the ath10k's driver prospective it seems that the
>> > board-2.bin provided on github[0] has the wrong filename:
>> >
>> > ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
>> > ath10k_ahb a000000.wifi: Falling back to user helper
>> > firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
>> > ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
>> > ath10k_ahb a000000.wifi: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
>> > ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00044 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 b9833652
>> > ath10k_ahb a000000.wifi: failed to fetch board data for bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-devn
>>
>> As far as I remember QCA4019 is supposed to used bmi chip
>> identification instead of pci ids for board files. For some reason the
>> driver uses pci ids on your device. Can you load ath10k_core with
>> debug_mask=0xffffff3f and post results, please? I recall OpenWRT was
>> messing with board file logic with its downstream patches and I
>> wouldn't be surprised if LEDE keeps on doing that as well.
>
> I've attached the logs you want for both cases (board.bin and board2.bin).
> LEDE does indeed patch ath10k [0]. But as far as I can tell, LEDE just
> adds a extra path to supply the caldata [1] via request_firmware.

Patch [1] is wrong. I find it frustrating OpenWRT/LEDE doesn't try to
work with upstream on ixing these things right.

You seem to have cal data file (I assume you extracted it from device
flash partition). In this case there's no need for board file.

Just in case - are you sure it's complete cal data and pre-cal? I
recall qca4019 have the following flow: pre-cal -> otp get chip id ->
get proper board file -> populate via otp (see commit 3d9195ea19e48).

If it's really cal then I think a patch will be required (but this
needs to land in upstream this time). Something like this is probably
fine (didn't test!):

--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -658,6 +658,11 @@ static int
ath10k_core_get_board_id_from_otp(struct ath10k *ar)

        address = ar->hw_params.patch_load_addr;

+       if (ar->cal_data) {
+               ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot skipping board
id, cal data present\n");
+               return 0;
+       }
+
        if (!ar->normal_mode_fw.fw_file.otp_data ||
            !ar->normal_mode_fw.fw_file.otp_len) {
                ath10k_warn(ar,
@@ -1075,6 +1080,11 @@ static int ath10k_core_fetch_board_file(struct
ath10k *ar)
        char boardname[100];
        int ret;

+       if (ar->cal_data) {
+               ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot skipping board
file, cal data present\n");
+               return 0;
+       }
+
        ret = ath10k_core_create_board_name(ar, boardname, sizeof(boardname));
        if (ret) {
                ath10k_err(ar, "failed to create board name: %d", ret);


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
