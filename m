Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx9M3-0004im-5S
 for ath10k@lists.infradead.org; Tue, 04 Sep 2018 11:19:17 +0000
From: Wen Gong <wgong@qti.qualcomm.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN
 feature
Date: Tue, 4 Sep 2018 11:18:25 +0000
Message-ID: <b6d8ada015e04738b6b3cee95e485e14@aptaiexm02f.ap.qualcomm.com>
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
 <877ek18vyn.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <877ek18vyn.fsf@kamboji.qca.qualcomm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Kalle Valo
> Sent: Tuesday, September 4, 2018 5:15 PM
> To: Wen Gong <wgong@codeaurora.org>
> Cc: linux-wireless@vger.kernel.org; ath10k@lists.infradead.org
> Subject: [EXTERNAL] Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN
> feature
> 
> Wen Gong <wgong@codeaurora.org> writes:
> 
> > For WoWLAN support, it expect to support wake up based on discovery of
> [...]
> 
> > +	channel_list = (u32 *)ptr;
> > +	for (i = 0; i < cmd->num_of_channels; i++)
> > +		channel_list[i] = pno->a_networks[0].channels[i];
> 
> channel_list does not look endian safe to me, I'll change this to use __le32.
Yes, __le32 is more safe.

> > +enum wmi_nlo_cipher_algorithm {
> > +	WMI_NLO_CIPHER_ALGO_NONE           = 0x00,
> > +	WMI_NLO_CIPHER_ALGO_WEP40          = 0x01,
> > +	WMI_NLO_CIPHER_ALGO_TKIP           = 0x02,
> > +	WMI_NLO_CIPHER_ALGO_CCMP           = 0x04,
> > +	WMI_NLO_CIPHER_ALGO_WEP104         = 0x05,
> > +	WMI_NLO_CIPHER_ALGO_BIP            = 0x06,
> > +	WMI_NLO_CIPHER_ALGO_WPA_USE_GROUP  = 0x100,
> > +	WMI_NLO_CIPHER_ALGO_RSN_USE_GROUP  = 0x100,
> 
> Two defines with the same value 0x100, is this really correct?

Yes, it is an interface between host driver /firmware.

> --
> Kalle Valo
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
