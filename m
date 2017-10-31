Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9Y24-0001vr-7p
 for ath10k@lists.infradead.org; Tue, 31 Oct 2017 15:00:54 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: Re: [v3] ath10k: rebuild crypto header in rx data frames
Date: Tue, 31 Oct 2017 15:00:14 +0000
Message-ID: <1509462013076.60330@qti.qualcomm.com>
References: <1509035774-26553-1-git-send-email-kvalo@qca.qualcomm.com>
 <59b2ec22dc9c4db0bd30a65dba660b1c@euamsexm01a.eu.qualcomm.com>
 <154f13b8-1e77-dbe5-4cb0-81c534dbc40b@dd-wrt.com>,
 <92bd2ece-dd71-b115-22c1-9a105df3612c@dd-wrt.com>
In-Reply-To: <92bd2ece-dd71-b115-22c1-9a105df3612c@dd-wrt.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


Sorry top posting.

The issues in raw mode with CCMP-256, GCMP and GCMP-256 were already known =
and
the same was captured in the commit log. As mentioned in the commit log, ra=
w mode
with these ciphers does not work even without this particular patch and it =
needs some cleanup
like done in the follow up patch https://patchwork.kernel.org/patch/1002909=
9/.

Vasanth
________________________________________
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Sent: Tuesday, October 31, 2017 8:24 PM
To: Kalle Valo
Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; Vasanthakum=
ar Thiagarajan
Subject: Re: [v3] ath10k: rebuild crypto header in rx data frames

the same is for the MIC

+               /* MIC */
+               if ((status->flag & RX_FLAG_MIC_STRIPPED) &&
+                   enctype =3D=3D HTT_RX_MPDU_ENCRYPT_AES_CCM_WPA2)
+                       skb_trim(msdu, msdu->len - 8);


this code looks wrong too

Am 30.10.2017 um 10:32 schrieb Sebastian Gottschall:
> will check it tomorrow including gcmp-256, ccmp-256. was out for
> weekend :-)
>
> Am 30.10.2017 um 09:39 schrieb Kalle Valo:
>> Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>
>>> Rx data frames notified through HTT_T2H_MSG_TYPE_RX_IND and
>>> HTT_T2H_MSG_TYPE_RX_FRAG_IND expect PN/TSC check to be done
>>> on host (mac80211) rather than firmware. Rebuild cipher header
>>> in every received data frames (that are notified through those
>>> HTT interfaces) from the rx_hdr_status tlv available in the
>>> rx descriptor of the first msdu. Skip setting RX_FLAG_IV_STRIPPED
>>> flag for the packets which requires mac80211 PN/TSC check support
>>> and set appropriate RX_FLAG for stripped crypto tail. Hw QCA988X,
>>> QCA9887, QCA99X0, QCA9984, QCA9888 and QCA4019 currently need the
>>> rebuilding of cipher header to perform PN/TSC check for replay
>>> attack.
>>>
>>> Please note that removing crypto tail for CCMP-256, GCMP and
>>> GCMP-256 ciphers
>>> in raw mode needs to be fixed. Since Rx with these ciphers in raw
>>> mode does not work in the current form even without this patch and
>>> removing crypto tail for these chipers needs clean up, raw mode related
>>> issues in CCMP-256, GCMP and GCMP-256 can be addressed in follow up
>>> patches.
>>>
>>> Tested-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
>>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
>>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>> Patch applied to ath-current branch of ath.git, thanks.
>>
>> 7eccb738fce5 ath10k: rebuild crypto header in rx data frames
>>
>

--
Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Stubenwaldallee 21a, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
