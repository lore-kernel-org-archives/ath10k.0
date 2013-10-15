Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW7IW-0005Vz-3u
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 16:16:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/7] ath10k: fix scheduling while atomic bug
References: <20131015161434.21869.51150.stgit@localhost6.localdomain6>
Date: Tue, 15 Oct 2013 19:16:11 +0300
In-Reply-To: <20131015161434.21869.51150.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Tue, 15 Oct 2013 19:14:34 +0300")
Message-ID: <87zjqabjck.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Michal Kazior <michal.kazior@tieto.com>
>
> Recent WMI/HTC changes made it possible for WMI
> commands to sleep (if there's not enough HTC TX
> credits to submit a command). TX path is in an
> atomic context so calling WMI commands in it is
> wrong.
>
> This simply moves WEP key index update to a worker
> and fixes the 'scheduling while atomic' bug.
>
> This still leaves multiple WEP key handling laggy,
> i.e. some frames may be TXed with an old/different
> key (although recipient should still be able to RX
> them).
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Please ignore, I sent this accidentally too early.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
