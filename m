Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fb3R2-0007Do-UJ
 for ath10k@lists.infradead.org; Thu, 05 Jul 2018 12:32:35 +0000
Received: by mail-wm0-x241.google.com with SMTP id s14-v6so10578572wmc.1
 for <ath10k@lists.infradead.org>; Thu, 05 Jul 2018 05:32:22 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: ath10k: Non-passive scan on DFS channels
Date: Thu, 05 Jul 2018 14:32:16 +0200
Message-ID: <43739898.vuglHYUBSu@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2427479070994691372=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, simon.wunderlich@openmesh.com

--===============2427479070994691372==
Content-Type: multipart/signed; boundary="nextPart2218260.b57Lj5TACd"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2218260.b57Lj5TACd
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

it was noticed that ath10k is actively scanning on DFS channels. This seems to 
be a bad idea.

It looks like the passive flag [1] is only specified when no ssid was 
requested or when the channel is marked as NO_IR [2]. But interestingly, the 
channel information for the scan also contains a setting chan_radar. And both 
information is given to the firmware.

How does the firmware react here? Does it really try to stop scanning actively 
on DFS channels or should the ath10k driver make sure to mark DFS channels 
also as NO_IR for the scan? At least I would guess that the WMI_CHAN_FLAG_DFS 
is completely ignored by the scan code of the QCA firmware.

    diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
    index 541bc1c4b2f7..2e4111040eb4 100644
    --- a/drivers/net/wireless/ath/ath10k/mac.c
    +++ b/drivers/net/wireless/ath/ath10k/mac.c
    @@ -3083,6 +3083,8 @@ static int ath10k_update_channel_list(struct ath10k *ar)
     				!!(channel->flags & IEEE80211_CHAN_RADAR);
     
     			passive = channel->flags & IEEE80211_CHAN_NO_IR;
    +			passive |= ch->chan_radar;
    +
     			ch->passive = passive;
     
     			ch->freq = channel->center_freq;

At least mac80211 actually handles both flags the same when it decides for 
probe vs. simple delay [4] during the scan of a channel


Simon can most likely provide more details about the problem.

Kind regards,
	Sven

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath10k/mac.c?id=fc36def997cfd6cbff3eda4f82853a5c311c5466#n5737
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath10k/mac.c?id=fc36def997cfd6cbff3eda4f82853a5c311c5466#n3086
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath10k/wmi.c?id=fc36def997cfd6cbff3eda4f82853a5c311c5466#n1661
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/mac80211/scan.c?id=fc36def997cfd6cbff3eda4f82853a5c311c5466#n846
--nextPart2218260.b57Lj5TACd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAls+D9AACgkQXYcKB8Em
e0a64g/9Gau82slIgYB3/9qLAzd4Nm2kWh5+Mr2j5Hc/PZ1BCGn/jqL0RfvT1a5c
R6m7gJNT3BPesN0llenjIbTFzzqTFmKGPCqv30U6OQoSCVmTJrYlAHs2kgoF7DiB
RCbbdDt8ZQJQHiX5m0RxnkqGL4ZaLIXAXAVG05yJ7TqPPEpuJ5wniftfKP67RZGc
0gON2/mmOjU1UHqrlRb7lPHlD7yxoWabZc3Kyuk7COB4RnGXSVol0Ob/EvPT1+jP
5m/EYXopabPnJ2WCx9niXpuwmLWC0MGqcxSg3m+gaWXsdq07pbuq/5SMRhIzpRuM
rK2XuPCvaViqwrcB+jttJQK3Kfxs9VNI9iPb5U8fALPuQ8d9oSc0nRmtepmMJDp3
lTt6A/m4JBb3pXIDfYlGpPYrzsw7wRYX9HciNK8SwOPXgxBNkzOxTnnpp96Qk9HD
dCYL0YeOfyjDl4rIEWH8Zy7jg5vRC9AJb6SVitwvXepbxc4kRruVSHsoKKrIVCUf
tW/+nlhkYpauGb801Pwi1pflIWH1KxXhneOILsgnMA1CeL8Kq8WVcZMZrT06mLwS
cMTBZ2FxUYFt544eN0l0bhFn007I5AhEVcY+PVVcfxjx8fd4ssdzklLnyqBSgzF8
6t5RwkuzZG5CO7w8pmLMFYPx60SLKqRrlY7KI76IKtlseee2U6I=
=uSy5
-----END PGP SIGNATURE-----

--nextPart2218260.b57Lj5TACd--



--===============2427479070994691372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2427479070994691372==--
