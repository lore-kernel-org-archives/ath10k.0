Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxNul-0004rt-Ac
 for ath10k@lists.infradead.org; Wed, 05 Sep 2018 02:51:32 +0000
MIME-Version: 1.0
Date: Wed, 05 Sep 2018 10:51:19 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
In-Reply-To: <87zhwx7ajo.fsf@kamboji.qca.qualcomm.com>
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
 <877ek18vyn.fsf@kamboji.qca.qualcomm.com>
 <b6d8ada015e04738b6b3cee95e485e14@aptaiexm02f.ap.qualcomm.com>
 <87zhwx7ajo.fsf@kamboji.qca.qualcomm.com>
Message-ID: <92bec84a762be7589b13274fb30dd649@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Wen Gong <wgong@qti.qualcomm.com>, ath10k@lists.infradead.org

On 2018-09-04 19:43, Kalle Valo wrote:
> Wen Gong <wgong@qti.qualcomm.com> writes:
> 
>>> > +enum wmi_nlo_cipher_algorithm {
>>> > +	WMI_NLO_CIPHER_ALGO_NONE           = 0x00,
>>> > +	WMI_NLO_CIPHER_ALGO_WEP40          = 0x01,
>>> > +	WMI_NLO_CIPHER_ALGO_TKIP           = 0x02,
>>> > +	WMI_NLO_CIPHER_ALGO_CCMP           = 0x04,
>>> > +	WMI_NLO_CIPHER_ALGO_WEP104         = 0x05,
>>> > +	WMI_NLO_CIPHER_ALGO_BIP            = 0x06,
>>> > +	WMI_NLO_CIPHER_ALGO_WPA_USE_GROUP  = 0x100,
>>> > +	WMI_NLO_CIPHER_ALGO_RSN_USE_GROUP  = 0x100,
>>> 
>>> Two defines with the same value 0x100, is this really correct?
>> 
>> Yes, it is an interface between host driver /firmware.
> 
> Yeah, I know it's an interface between the host driver and the firmware
> but it does not make any sense and is just confusing. Either of them
> should be dropped.
yes, either of them can be dropped.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
