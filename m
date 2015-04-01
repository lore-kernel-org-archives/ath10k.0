Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdMK0-0003Nx-BN
 for ath10k@lists.infradead.org; Wed, 01 Apr 2015 17:20:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix survey reporting
References: <1427200691-7109-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 1 Apr 2015 20:20:47 +0300
In-Reply-To: <1427200691-7109-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 24 Mar 2015 12:38:11 +0000")
Message-ID: <87oan7ydcg.fsf@kamboji.qca.qualcomm.com>
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

> Number of channels is stored in a separate macro
> in a header file and channel list is constructed
> independently. The macro is used to define survey
> array.
>
> This fixes a recent regression introduced after
> adding support for 144 channel. The regression
> would lead to a warning and incomplete survey data
> on channel 165:
>
>   chan info: invalid frequency 5825 (idx 38 out of bounds)
>
> Also make sure to enforce the sizes and avoid this
> kind of problem in the future.
>
> Fixes: 4a7898fed5f3 ("ath10k: enable channel 144 on 5GHz band")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
