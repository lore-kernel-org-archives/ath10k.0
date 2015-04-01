Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdMXU-00038x-BL
 for ath10k@lists.infradead.org; Wed, 01 Apr 2015 17:34:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ath10k: improve set_bitrate_mask
References: <1427798961-7334-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 1 Apr 2015 20:34:20 +0300
In-Reply-To: <1427798961-7334-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 31 Mar 2015 10:49:19 +0000")
Message-ID: <874mozycpv.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This makes set_bitrate_mask more flexible by
> allowing more than applying simple single rate or
> max nss limits.
>
> This still isn't ideal and VHT MCSs can't be set
> separately (only a few range-options are allowed).
>
> v2:
>  * fix ouf-of-bounds
>  * rebased to master branch + multi-channel patches
>
> This will not apply cleanly without multi-channel
> support and conflict resolution will be
> non-trivial.
>
>
> Michal Kazior (2):
>   ath10k: clean up set_bitrate_mask handling

Thanks, this patch applied.

>   ath10k: implement more versatile set_bitrate_mask

This patch dropped as requested.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
