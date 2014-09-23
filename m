Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWQ55-0000Xa-Nn
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 13:24:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: save firmware stacks upon firmware crash
References: <1409934849-23078-1-git-send-email-greearb@candelatech.com>
Date: Tue, 23 Sep 2014 16:23:57 +0300
In-Reply-To: <1409934849-23078-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Fri, 5 Sep 2014 09:34:08
 -0700")
Message-ID: <87vboecvwy.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Should help debug firmware crashes, and give users a way
> to provide some useful debug reports to firmware developers.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Like we talked on IRC, I think it's better to take a dump of the whole
DRAM and find all the info during postprocessing in user space. I just
consider it too much work to investigate firmware internals from ath10k
as the internals can change between firmware versions. In user space
that's a lot easier to manage.

Of course downside is the increased memory usage, but if that becomes a
problem there are ways to solve that. For example, adding a module
parameter with bitmask for individually enabling enum
ath10k_fw_crash_dump_type is first which comes to my mind.

I have patches ready for the DRAM thing, but I have some issues which I
found during testing. I'll post the patches soon as I have solved the
issues, but don't know how long that will take.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
