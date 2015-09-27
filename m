Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgBQX-0003n1-3O
 for ath10k@lists.infradead.org; Sun, 27 Sep 2015 12:51:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath: fix incorrect PPB on JAPAN chirp radar
References: <1441819724-25344-1-git-send-email-poh@qca.qualcomm.com>
Date: Sun, 27 Sep 2015 15:51:06 +0300
In-Reply-To: <1441819724-25344-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Wed, 9 Sep 2015 10:28:44 -0700")
Message-ID: <87k2rcc9fp.fsf@kamboji.qca.qualcomm.com>
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

> The number of pulses per burst on Japan chirp radar is
> between 1 and 3. The previous value, 20, is representing
> number of bursts, but since current DFS detector is using
> pulse detection other than bursts, use the pulse number
> for correct radar detection.
> Also using the highest number helps to avoid false detection.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
