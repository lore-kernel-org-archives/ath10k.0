Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V07zy-0003pB-G4
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 10:33:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 0/3] ath10k: hardware recovery
References: <1372148011-28234-1-git-send-email-michal.kazior@tieto.com>
 <1373961277-14784-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 19 Jul 2013 13:32:48 +0300
In-Reply-To: <1373961277-14784-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 16 Jul 2013 09:54:34 +0200")
Message-ID: <87vc464z73.fsf@kamboji.qca.qualcomm.com>
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

> Respin of hw recovery. This implements recovery
> from a firmware crash.
>
> Note: this is based on my
>       "ath10k: device setup refactor" patchset.
>
> v3:
>  * rename RESTARTING_ON/OFF to RESTARTING/RESTARTED
>  * update commit message for 'create debufs..'
>
> Michal Kazior (3):
>   ath10k: implement device recovery
>   ath10k: implement fw crash simulation command
>   ath10k: create debugfs interface to trigger fw crash

Thanks, applied patches 1-2 and dropped patch 3.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
