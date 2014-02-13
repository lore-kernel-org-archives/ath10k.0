Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDyAT-0002Te-6q
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 15:25:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: reduce number of host corruptions
References: <1392048864-13352-1-git-send-email-marek.puzyniak@tieto.com>
Date: Thu, 13 Feb 2014 17:25:10 +0200
In-Reply-To: <1392048864-13352-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Mon, 10 Feb 2014 17:14:21 +0100")
Message-ID: <87d2ir827d.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> This patchset reduces frequency of a strange HW bug
> in CUS232 boards.
>
> The bug happens in some workloads with different
> frequency with different hardware spinoffs. It is
> triggered by a cold reset after HW/FW has been
> excercised with some work. On x86 this could be a hang,
> on AP135 it is a data bus error. Frequency of problem
> is reduced in driver by calling first warm reset
> instead of cold reset. When warm reset fails then
> driver will call cold reset. 
>
> Marek Puzyniak (2):
>   ath10k: refactor suspend/resume functions
>   ath10k: suspend hardware before reset
>
> Michal Kazior (1):
>   ath10k: fix device initialization routine

Thanks, all three patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
