Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZD77-0005IO-TG
 for ath10k@lists.infradead.org; Thu, 24 Oct 2013 05:05:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  Log firmware debug prints and dbg logs.
References: <1382567507-19154-1-git-send-email-greearb@candelatech.com>
Date: Thu, 24 Oct 2013 08:05:14 +0300
In-Reply-To: <1382567507-19154-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 23 Oct 2013 15:31:47
 -0700")
Message-ID: <87y55jjm2d.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

<greearb@candelatech.com> writes:

> From: Ben Greear <greearb@candelatech.com>
>
> This should aid in debugging firmware issues on standard
> NIC hardware that does not have a serial port.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

I have been working on using a tracepoint for this. That way we can do
this in user space.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
