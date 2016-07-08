Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLPQA-0002Ox-BL
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 06:37:54 +0000
MIME-Version: 1.0
Subject: Re: [v3] ath10k: Fix 10.4 extended peer stats update
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1464851602-12969-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <d69d17f6b281447d8a26994a0a1a2772@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 08:37:25 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> 10.4 'extended peer stats' will be not be appended with normal peer stats
> data and they shall be coming in separate chunks. Fix this by maintaining
> a separate linked list 'extender peer stats' for 10.4 and update
> rx_duration for per station statistics. Also parse through beacon filter
> (if enabled), to make sure we parse the extended peer stats properly.
> This issue was exposed when more than one client is connected and
> extended peer stats for 10.4 is enabled
> 
> The order for the stats is as below
> S - standard peer stats, E- extended peer stats, B - beacon filter stats
> 
> {S1, S2, S3..} -> {B1, B2, B3..}(if available) -> {E1, E2, E3..}
> 
> Fixes: f9575793d44c ("ath10k: enable parsing per station rx duration for 10.4")
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

4a49ae94a448 ath10k: fix 10.4 extended peer stats update

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9149357/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
