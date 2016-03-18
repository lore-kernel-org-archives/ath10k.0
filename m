Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agpDr-0005MU-Vy
 for ath10k@lists.infradead.org; Fri, 18 Mar 2016 07:53:28 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5] ath10k: move mgmt descriptor limit handle under mgmt_tx
Date: Fri, 18 Mar 2016 07:53:00 +0000
Message-ID: <87egb8i5no.fsf@kamboji.qca.qualcomm.com>
References: <1457535346-16159-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1457535346-16159-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 9 Mar 2016 20:25:46 +0530")
Content-Language: en-US
Content-ID: <55A9437A97E7CB4E943D3F394DA7FF7A@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Frames that are transmitted via MGMT_TX are using reserved descriptor
> slots in firmware. This limitation is for the htt_mgmt_tx path itself,
> not for mgmt frames per se. In 16 MBSSID scenario, these reserved slots
> will be easy exhausted due to frequent probe responses. So for 10.4
> based solutions, probe responses are limited by a threshold (24).
>
> management tx path is separate for all except tlv based solutions. Since
> tlv solutions (qca6174 & qca9377) do not support 16 AP interfaces, it is
> safe to move management descriptor limitation check under mgmt_tx
> function. Though CPU improvement is negligible, unlikely conditions or
> never hit conditions in hot path can be avoided on data transmission.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
