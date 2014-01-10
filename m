Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1ZFQ-0005b4-Ay
 for ath10k@lists.infradead.org; Fri, 10 Jan 2014 10:23:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: implement and use new beacon method
References: <1389287073-10939-1-git-send-email-marek.puzyniak@tieto.com>
Date: Fri, 10 Jan 2014 12:23:01 +0200
In-Reply-To: <1389287073-10939-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Thu, 9 Jan 2014 18:04:33 +0100")
Message-ID: <878uuo9lve.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> From: Michal Kazior <michal.kazior@tieto.com>
>
> Until now ath10k used a copy-by-value beacon
> submission.
>
> The new method passes a DMA address via WMI
> command only. This command contains additional
> metadata that fixes AP behaviour with regard
> to powersave buffering.
>
> This also fixes strange bug when multicast traffic
> would freeze TX indefinitely.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

Same here, also so few conflicts. Please check:

https://github.com/kvalo/ath/commit/b700fa4a953b3f01ee5ff167fb94943de13d6b34

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
