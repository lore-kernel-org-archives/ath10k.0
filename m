Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V58uG-0007DZ-1O
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 06:32:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: implement checksum offloading
References: <1375260477-17030-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 2 Aug 2013 09:31:33 +0300
In-Reply-To: <1375260477-17030-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 31 Jul 2013 10:47:55 +0200")
Message-ID: <87vc3oppru.fsf@kamboji.qca.qualcomm.com>
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

> Hi,
>
> This patchset adds tx and rx checksum offloading
> to ath10k driver.
>
> I don't have any hard numbers but I did observe a
> consistently sligthly better performance on AP135
> + ath10k. Nothing ground breaking though.
>
>
> Michal Kazior (2):
>   ath10k: implement rx checksum offloading
>   ath10k: implement tx checksum offloading

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
