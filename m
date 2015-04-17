Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yizri-0001YQ-LU
 for ath10k@lists.infradead.org; Fri, 17 Apr 2015 06:35:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add extra check for frame tracing
References: <1428670948-7665-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 17 Apr 2015 09:34:32 +0300
In-Reply-To: <1428670948-7665-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 10 Apr 2015 13:02:28 +0000")
Message-ID: <87r3rj4613.fsf@kamboji.qca.qualcomm.com>
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

> Frames are logged via tracing in two slices:
> header and payload, separately. This is done for
> performance reasons when one wants to, e.g.
> analyse metadata only of frames only.
>
> If for some reason device delivered a frame buffer
> which was sized below what 802.11 header implied
> tracing logic would blow doing an invalid memory
> accesses.
>
> I've hit this problem when running IBSS on QCA988X
> with 999.999.0.636 and tracing at the same time.
>
> Fixes: 5ce8e7fdcc7a ("ath10k: handle ieee80211 header and payload tracing separately")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
