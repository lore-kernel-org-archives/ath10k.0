Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAHHb-0004o8-8F
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 17:28:57 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] cfg80211: Add cumulative channel survey dump support.
Date: Tue, 17 Sep 2019 19:27:50 +0200
Message-ID: <2083094.mFhUXK7yzB@bentobox>
In-Reply-To: <ebf1c95acb34649b3d2a5435142dc06a@codeaurora.org>
References: <1526980556-26707-1-git-send-email-vnaralas@codeaurora.org>
 <1527069282.3759.16.camel@sipsolutions.net>
 <ebf1c95acb34649b3d2a5435142dc06a@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9017708946952073294=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: vnaralas@codeaurora.org, ath10k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, slakkavalli@datto.com, linux-wireless@vger.kernel.org, Ben Greear <greearb@candelatech.com>, sw@simonwunderlich.de

--===============9017708946952073294==
Content-Type: multipart/signed; boundary="nextPart3810160.A0oiceiTxs"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3810160.A0oiceiTxs
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 31 May 2018 11:06:59 CEST vnaralas@codeaurora.org wrote:
> I will sent next version of patch with updated commit log.

Can you please point me to the second version?

Btw. I've just checked the minimal changes in ath10k to get this working. It 
seems we need SURVEY_INFO_NON_ACC_DATA in ath10k's ath10k_get_survey + memset 
of ar->survey[idx].

But right now the total time looks (especially) wrong to me. At least it is 
rather unlikely that I can have around 30 second active time delta in
roughly 1 real world second.  Maybe a bug with the READ_CLEAR handling in
firmware 10.2.4-1.0-00043 or maybe all firmware version? More logs about
that at the end.

@Ben: Was this also what you've experience in the past with the 10.2 firmware
bss_chan_info counter bugs or am I just misusing the functionality of the
firmware?


And yes, I am aware that the minimal change in ath10k is not enough - but it 
was good enough for a simple test. I think ath10k_wmi_event_pdev_bss_chan_info 
+ ath10k_hw_fill_survey_time also have to be modified to accumulate .time, 
.time_busy, .time_rx, and .time_tx.  But it makes me wonder whether there is 
now any benefit from the cfg80211 patch (for ath10k). You can basically get 
the same functionality from

--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -216,8 +217,9 @@ void ath10k_hw_fill_survey_time(struct ath10k *ar, struct survey_info *survey,
 	cc -= cc_prev - cc_fix;
 	rcc -= rcc_prev - rcc_fix;
 
-	survey->time = CCNT_TO_MSEC(ar, cc);
-	survey->time_busy = CCNT_TO_MSEC(ar, rcc);
+	survey->time += CCNT_TO_MSEC(ar, cc);
+	if (survey->filled & SURVEY_INFO_TIME_BUSY)
+		survey->time_busy += CCNT_TO_MSEC(ar, rcc);
 }
 
 const struct ath10k_hw_ops qca988x_ops = {
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4905,6 +4905,13 @@ static int ath10k_wmi_event_pdev_bss_chan_info(struct ath10k *ar,
 		   "wmi event pdev bss chan info:\n freq: %d noise: %d cycle: busy %llu total %llu tx %llu rx %llu rx_bss %llu\n",
 		   freq, noise_floor, busy, total, tx, rx, rx_bss);
 
+	/* everything zero means invalid data -> drop it to avoid ruining the
+	 * noisefloor
+	 */
+	if (noise_floor == 0 && busy == 0 && total == 0 && tx == 0 && rx == 0 &&
+	    rx_bss == 0)
+		return -EPROTO;
+
 	spin_lock_bh(&ar->data_lock);
 	idx = freq_to_idx(ar, freq);
 	if (idx >= ARRAY_SIZE(ar->survey)) {
@@ -4916,10 +4923,10 @@ static int ath10k_wmi_event_pdev_bss_chan_info(struct ath10k *ar,
 	survey = &ar->survey[idx];
 
 	survey->noise     = noise_floor;
-	survey->time      = div_u64(total, cc_freq_hz);
-	survey->time_busy = div_u64(busy, cc_freq_hz);
-	survey->time_rx   = div_u64(rx_bss, cc_freq_hz);
-	survey->time_tx   = div_u64(tx, cc_freq_hz);
+	survey->time      += div_u64(total, cc_freq_hz);
+	survey->time_busy += div_u64(busy, cc_freq_hz);
+	survey->time_rx   += div_u64(rx_bss, cc_freq_hz);
+	survey->time_tx   += div_u64(tx, cc_freq_hz);
 	survey->filled   |= (SURVEY_INFO_NOISE_DBM |
 			     SURVEY_INFO_TIME |
 			     SURVEY_INFO_TIME_BUSY |


Both version get to the same (incorrect) timing results :)

Here is the time data I get reported from the firmware (entries
with 0 in each field were removed)

    [  162.875008] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 83895506 total 3801904834 tx 267520 rx 71507709 rx_bss 0
    [  163.917612] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 85745287 total 3889908918 tx 214016 rx 73140278 rx_bss 0
    [  164.960733] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 87612741 total 3977912729 tx 221408 rx 74750020 rx_bss 22880
    [  166.004348] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 89489393 total 4065916182 tx 214016 rx 76383244 rx_bss 0
    [  167.048330] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 91292949 total 4153919205 tx 214016 rx 77942266 rx_bss 0
    [  168.091828] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 93118897 total 4241923018 tx 187264 rx 79551036 rx_bss 0
    [  169.134349] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 47834553 total 2182443012 tx 160512 rx 40879686 rx_bss 0
    [  170.177511] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 49751910 total 2270447314 tx 167904 rx 42539598 rx_bss 22880
    [  171.221156] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 51639827 total 2358451435 tx 160512 rx 44184146 rx_bss 0
    [  172.262426] wmi event pdev bss chan info:  freq: 5180 noise: -102 cycle: busy 53420475 total 2446455772 tx 133760 rx 45746866 rx_bss 0
    [  173.309067] wmi event pdev bss chan info:  freq: 5180 noise: -103 cycle: busy 55218240 total 2534459001 tx 107008 rx 47327088 rx_bss 0

The well trained observer might already have noticed that some of the values 
are steadily increasing until they suddenly decrease again. And the delta for 
total is mostly around 1s - besides when it isn't. Then it can also be -23403 
seconds (while the absolute value *doesn't* return to a value near zero but
to a value near 0x7fffffff). The rx value also jumps around in a similar way 
(just by a completely different value).

So whatever the firmware does when it gets a 
WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR -  it is not a CLEAR after read. And they 
also don't simply wrap around but there all values have to get some kind of 
"fix" like the active time one shown in ath10k_hw_fill_survey_time.
Just that the actual "fixes" for them are unknown. To me it looks like
firmware ATH10K_HW_CC_WRAP_SHIFTED_ALL have busy and rx interlinked with
the overflow of total. But the tx and rx_bss are actually cleared.

Other than that, the counters are wrapping every ~14-30 seconds. So we
also need also some worker for ath10k which every couple of seconds
requests new values for all the channel from the firmware. Which already
sounds problematic because I get
"ath10k_pci 0000:00:00.0: bss channelsurvey timed out" all the time
when requesting surveys manually.

Kind regards,
	Sven
--nextPart3810160.A0oiceiTxs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl2BF5YACgkQXYcKB8Em
e0Z4pg/+MtKXb2F/v6+Z2X7Dc0HSAYJRPEKY8ecaP1y24F6m7i3nDT0E3ew5szim
s0LLI57D5Zc4XS56k4p1H65kX0grwX3ERSR/tgZtTUwbVhHwG+lxKSgSSSKJtaoo
kelR/36nSS+ozl1p2l2DD49S5f8Yw1GCouvAHIj+eniCX46N0cPNUGX+KRjZDLe0
PZGJUt4iTRZYLCdJbY7JHLhbKXOQPfqEi3B5Zb2i1eiQOdugY04AYJBwsLMKNsAZ
yFEN7IrHECirlfubwbFNl3qBSJHTQhWKM6DvwHjF91oP4vgi+NDGb8zlD4GSCMHP
wOSg+L8gU2masje601bYThkVL6rFx8THwYuVigSplMvOlcefiGPQAgdSSft2gXWR
lpqgS+Cg6p7oEGJEZWTMiJcaxvUUV/v+jD+iFgSae/KDbt+vMNZvRWN8S59+mFy/
OMCkeZ/Jhif2lfQlqj6YythQ28YMU3JOsA9bZnV13+QNtxwMq/2eI/Ff88wQTMxD
j58OkxpgZHKnZTdqnlfeYBH5h1xF64BvVW3s3Z5amek5611DaxG6sMUYbq2FyMkf
WfkdtVoh0t3e11GbFnMi55u2WjdBVW4U9dEqxa4RrBOQRHXAg80cGLQ1QLJeYtK6
VBNLhx/uh8dYtUBP01U5Sn74IyBmvBYpKYYDe3YipoypRDqlRf0=
=xhc9
-----END PGP SIGNATURE-----

--nextPart3810160.A0oiceiTxs--





--===============9017708946952073294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============9017708946952073294==--
