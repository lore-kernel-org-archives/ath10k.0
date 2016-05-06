Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aykBw-00055J-1n
 for ath10k@lists.infradead.org; Fri, 06 May 2016 18:09:32 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: remove VHT capabilities from 2.4GHz
Date: Fri, 6 May 2016 18:08:51 +0000
Message-ID: <87inyrnjnx.fsf@kamboji.qca.qualcomm.com>
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
In-Reply-To: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com> (Kalle
 Valo's message of "Thu, 21 Apr 2016 16:17:49 +0300")
Content-Language: en-US
Content-ID: <88DB88BC1478864F977F9018E6C8E517@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Johannes Berg <johannes.berg@intel.com>
>
> According to the spec, VHT doesn't exist in 2.4GHz.
>
> There are vendor extensions to allow a subset of VHT to work
> (notably 256-QAM), but since mac80211 doesn't support those
> advertising VHT capability on 2.4GHz leads to the behaviour
> of reporting VHT capabilities but not being able to use any
> of them due to mac80211's code requiring 80 MHz support.
>
> Remove the VHT capabilities from 2.4GHz for now. If mac80211
> gets extended to use the (likely Broadcom) vendor IEs for it
> and handles the lack of 80 MHz support, it can be added back.
>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
