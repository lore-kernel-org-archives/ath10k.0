Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTWGj-00052V-1F
 for ath10k@lists.infradead.org; Thu, 05 Mar 2015 13:56:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath: Introduce chirp parameter used by DFS
References: <1423775825-19498-1-git-send-email-poh@qca.qualcomm.com>
Date: Thu, 5 Mar 2015 15:56:20 +0200
In-Reply-To: <1423775825-19498-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Thu, 12 Feb 2015 13:17:03 -0800")
Message-ID: <87k2yv4kfv.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> Some of radar types such as FCC radar type 5 require
> to look up chirp in pulse to detect genuine radar and
> it will prevent DFS channels from false radar detection.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, all three patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
