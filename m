Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V591J-0007NU-0o
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 06:39:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/5] ath10k: fixes
References: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 2 Aug 2013 09:38:57 +0300
In-Reply-To: <1375260915-22500-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 31 Jul 2013 10:55:10 +0200")
Message-ID: <87k3k4ppfi.fsf@kamboji.qca.qualcomm.com>
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
> This is a batch up of a few fixes for ath10k
> driver I had in my queue for some time now.
>
>
> Michal Kazior (5):
>   ath10k: prevent using invalid ringbuffer indexes
>   ath10k: make sure to use passive scan when n_ssids is 0
>   ath10k: advertise more conservative intf combinations
>   ath10k: zero arvif memory on add_interface()
>   ath10k: fix failpath in MSI-X setup

All applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
