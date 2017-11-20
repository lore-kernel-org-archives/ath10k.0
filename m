Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from james.theweblords.de ([217.11.55.87])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eGmdo-0001vu-VL
 for ath10k@lists.infradead.org; Mon, 20 Nov 2017 14:01:47 +0000
Date: Mon, 20 Nov 2017 15:01:15 +0100
From: Peter =?UTF-8?B?R3Jvw59l?= <pegro@friiks.de>
Subject: Re: Support for 5/10 MHz channel width
Message-ID: <20171120150115.0c0a8a3c@friiks.de>
In-Reply-To: <07148f03-50ac-72ef-3e34-9a93d5d75026@dd-wrt.com>
References: <20171118230818.5e07509a@friiks.de>
 <07148f03-50ac-72ef-3e34-9a93d5d75026@dd-wrt.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/LItI.H/L0axNZL=WqZOH0AJ"
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
To: ath10k@lists.infradead.org

--MP_/LItI.H/L0axNZL=WqZOH0AJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sun, 19 Nov 2017 00:35:22 +0100
Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:

> maybe easy to implement. the firmware does support it.
> --- wmi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Revision 3720)
> +++ wmi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Arbeitskopie)
> @@ -1986,6 +1986,8 @@
>  =C2=A0#define WMI_CHAN_FLAG_DFS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 10)
>  =C2=A0#define WMI_CHAN_FLAG_ALLOW_HT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (1 << 11)
>  =C2=A0#define WMI_CHAN_FLAG_ALLOW_VHT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 <=
< 12)
> +#define WMI_CHAN_FLAG_QUARTER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << =
13)
> +#define WMI_CHAN_FLAG_HALF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 14)
>=20
>  =C2=A0/* Indicate reason for channel switch */
>  =C2=A0#define WMI_CHANNEL_CHANGE_CAUSE_CSA (1 << 13)
>=20
> this should help you out with playing

Thanks for the hint.

I tried setting these flags, but my wifi card still uses full rate.

My test setup consists of 2 ath9k cards and 1 ath10k card (QCA988X). I'm ab=
le
to transmit frames between the ath9k cards using channel widths 5MHz, 10MHz=
 and
20Mhz (so half and quarter rates work), but I only see these frames on the
ath10k card when using 20MHz channel width. Therefor I assume, setting these
flags doesn't do anything or I missed something.

I tried firmware versions 10.2.4.70.54 and 10.2.4.70.66.

See attached patch and dmesg output.

Am I on the right track?

Regards
Peter

--MP_/LItI.H/L0axNZL=WqZOH0AJ
Content-Type: text/x-log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dmesg.log

[2039423.711620] ath10k_pci 0000:06:00.0: pci irq legacy oper_irq_mode 1 irq_mode 0 reset_mode 0
[2039423.877445] ath10k_pci 0000:06:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 19b6:d03c
[2039423.877447] ath10k_pci 0000:06:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 0
[2039423.877642] ath10k_pci 0000:06:00.0: firmware ver 10.2.4.70.66 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 c2dd2ad5
[2039423.933356] ath10k_pci 0000:06:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[2039425.110341] ath10k_pci 0000:06:00.0: wmi svc: 00000000: 0e 00 00 00 07 00 00 00 07 00 00 00 09 00 00 00  ................
[2039425.110344] ath10k_pci 0000:06:00.0: wmi svc: 00000010: 0f 00 00 00 0a 00 00 00 07 00 00 00 03 00 00 00  ................
[2039425.110346] ath10k_pci 0000:06:00.0: wmi svc: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[2039425.110348] ath10k_pci 0000:06:00.0: wmi svc: 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
[2039425.110352] ath10k_pci 0000:06:00.0: wmi mem_req_id 1 num_units 0 num_unit_info 2 unit size 440 actual units 145
[2039425.110381] ath10k_pci 0000:06:00.0: wmi event service ready min_tx_power 0x0000003f max_tx_power 0x0000003f ht_cap 0x0000085b vht_cap 0x338001b2 sw_ver0 0x41000042 sw_ver1 0x00000000 fw_build 0x00000000 phy_capab 0x00000001 num_rf_chains 0x00000003 eeprom_rd 0x00000000 num_mem_reqs 0x00000001
[2039425.110389] ath10k_pci 0000:06:00.0: wmi chunk 0 len 63800 requested, addr 0x76f30000
[2039425.110391] ath10k_pci 0000:06:00.0: wmi init 10.2
[2039425.119793] ath10k_pci 0000:06:00.0: wmi print 'P 135 V 16 T 433'
[2039425.130580] ath10k_pci 0000:06:00.0: wmi event ready sw_version 1090519106 abi_version 1 mac_addr 4c:5e:0c:XX:XX:XX status 0
[2039425.130667] ath10k_pci 0000:06:00.0: WMI vdev create: id 0 type 2 subtype 0 macaddr 4c:5e:0c:XX:XX:XX
[2039425.130670] ath10k_pci 0000:06:00.0: WMI vdev delete id 0
[2039425.130673] ath10k_pci 0000:06:00.0: wmi echo value 0x0ba991e9
[2039425.130900] ath10k_pci 0000:06:00.0: wmi event echo value 0x0ba991e9
[2039425.131063] ath10k_pci 0000:06:00.0: wmi disable pktlog
[2039425.131068] ath10k_pci 0000:06:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
[2039425.134118] ath10k_pci 0000:06:00.0: wmi disable pktlog

...

[2040684.886943] ath10k_pci 0000:06:00.0: wmi event debug mesg len 268
[2040684.928347] ath10k_pci 0000:06:00.0: mac chanctx add freq 5825 width 7 ptr ffff880068e8f658
[2040684.928352] ath10k_pci 0000:06:00.0: mac chanctx assign ptr ffff880068e8f658 vdev_id 0
[2040684.928354] ath10k_pci 0000:06:00.0: mac vdev 0 start center_freq 5825 phymode 11a
[2040684.928358] ath10k_pci 0000:06:00.0: wmi vdev start id 0x0 flags: 0x0, freq 5825, mode 0, ch_flags: 0x4000, max_power: 60
[2040684.936515] ath10k_pci 0000:06:00.0: WMI_VDEV_START_RESP_EVENTID
[2040684.936528] ath10k_pci 0000:06:00.0: mac vdev 0 cts_protection 0

--MP_/LItI.H/L0axNZL=WqZOH0AJ
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename=0001-ath10k-add-support-for-5-10-MHz-channels.patch

=46rom f48ebb763159a2369590c860c27504ad394b1aa4 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Peter=3D20Gro=3DC3=3D9Fe?=3D <pegro@friiks.de>
Date: Mon, 20 Nov 2017 14:52:33 +0100
Subject: [PATCH] ath10k: add support for 5 / 10 MHz channels
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Peter Gro=C3=9Fe <pegro@friiks.de>
---
 drivers/net/wireless/ath/ath10k/mac.c | 19 +++++++++++++++----
 drivers/net/wireless/ath/ath10k/wmi.c |  4 ++++
 drivers/net/wireless/ath/ath10k/wmi.h |  4 ++++
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/a=
th/ath10k/mac.c
index 55c808f03a84..635d53ae0ac7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -558,6 +558,8 @@ chan_to_phymode(const struct cfg80211_chan_def *chandef)
 		break;
 	case NL80211_BAND_5GHZ:
 		switch (chandef->width) {
+		case NL80211_CHAN_WIDTH_5:
+		case NL80211_CHAN_WIDTH_10:
 		case NL80211_CHAN_WIDTH_20_NOHT:
 			phymode =3D MODE_11A;
 			break;
@@ -576,10 +578,6 @@ chan_to_phymode(const struct cfg80211_chan_def *chande=
f)
 		case NL80211_CHAN_WIDTH_80P80:
 			phymode =3D MODE_11AC_VHT80_80;
 			break;
-		case NL80211_CHAN_WIDTH_5:
-		case NL80211_CHAN_WIDTH_10:
-			phymode =3D MODE_UNKNOWN;
-			break;
 		}
 		break;
 	default:
@@ -986,6 +984,12 @@ static int ath10k_monitor_vdev_start(struct ath10k *ar=
, int vdev_id)
 	arg.channel.chan_radar =3D
 			!!(channel->flags & IEEE80211_CHAN_RADAR);
=20
+	if (chandef->width =3D=3D NL80211_CHAN_WIDTH_10) {
+		arg.channel.rate_half =3D 1;
+	} else if (chandef->width =3D=3D NL80211_CHAN_WIDTH_5) {
+		arg.channel.rate_quarter =3D 1;
+	}
+
 	arg.channel.min_power =3D 0;
 	arg.channel.max_power =3D channel->max_power * 2;
 	arg.channel.max_reg_power =3D channel->max_reg_power * 2;
@@ -1433,6 +1437,12 @@ static int ath10k_vdev_start_restart(struct ath10k_v=
if *arvif,
 	arg.channel.max_reg_power =3D chandef->chan->max_reg_power * 2;
 	arg.channel.max_antenna_gain =3D chandef->chan->max_antenna_gain * 2;
=20
+	if (chandef->width =3D=3D NL80211_CHAN_WIDTH_10) {
+		arg.channel.rate_half =3D 1;
+	} else if (chandef->width =3D=3D NL80211_CHAN_WIDTH_5) {
+		arg.channel.rate_quarter =3D 1;
+	}
+
 	if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP) {
 		arg.ssid =3D arvif->u.ap.ssid;
 		arg.ssid_len =3D arvif->u.ap.ssid_len;
@@ -8202,6 +8212,7 @@ int ath10k_mac_register(struct ath10k *ar)
=20
 	ar->hw->wiphy->flags |=3D WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
 	ar->hw->wiphy->flags |=3D WIPHY_FLAG_HAS_CHANNEL_SWITCH;
+	ar->hw->wiphy->flags |=3D WIPHY_FLAG_SUPPORTS_5_10_MHZ;
 	ar->hw->wiphy->max_remain_on_channel_duration =3D 5000;
=20
 	ar->hw->wiphy->flags |=3D WIPHY_FLAG_AP_UAPSD;
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/a=
th/ath10k/wmi.c
index 3efb404b83c0..3d409878ab4a 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1635,6 +1635,10 @@ void ath10k_wmi_put_wmi_channel(struct wmi_channel *=
ch,
 		flags |=3D WMI_CHAN_FLAG_HT40_PLUS;
 	if (arg->chan_radar)
 		flags |=3D WMI_CHAN_FLAG_DFS;
+	if (arg->rate_half)
+		flags |=3D WMI_CHAN_FLAG_HALF;
+	if (arg->rate_quarter)
+		flags |=3D WMI_CHAN_FLAG_QUARTER;
=20
 	ch->mhz =3D __cpu_to_le32(arg->freq);
 	ch->band_center_freq1 =3D __cpu_to_le32(arg->band_center_freq1);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/a=
th/ath10k/wmi.h
index baa38c8f847c..f8848bd26011 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -1826,6 +1826,8 @@ struct wmi_channel_arg {
 	bool allow_vht;
 	bool ht40plus;
 	bool chan_radar;
+	bool rate_half;
+	bool rate_quarter;
 	/* note: power unit is 0.5 dBm */
 	u32 min_power;
 	u32 max_power;
@@ -1847,6 +1849,8 @@ enum wmi_channel_change_cause {
 #define WMI_CHAN_FLAG_DFS            (1 << 10)
 #define WMI_CHAN_FLAG_ALLOW_HT       (1 << 11)
 #define WMI_CHAN_FLAG_ALLOW_VHT      (1 << 12)
+#define WMI_CHAN_FLAG_QUARTER        (1 << 13)
+#define WMI_CHAN_FLAG_HALF           (1 << 14)
=20
 /* Indicate reason for channel switch */
 #define WMI_CHANNEL_CHANGE_CAUSE_CSA (1 << 13)
--=20
2.13.6


--MP_/LItI.H/L0axNZL=WqZOH0AJ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--MP_/LItI.H/L0axNZL=WqZOH0AJ--
