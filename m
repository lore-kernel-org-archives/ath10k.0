Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVFeQ-0002r8-DI
 for ath10k@lists.infradead.org; Wed, 02 Apr 2014 07:31:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: remove not needed warning when peer unmap
References: <1396340628-4570-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Wed, 2 Apr 2014 10:31:31 +0300
In-Reply-To: <1396340628-4570-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Tue, 1 Apr 2014 10:23:48 +0200")
Message-ID: <877g78rxv0.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Remove not needed warning when get peer unmap
> event from the firmware. This is not critical
> message. Instead print this as a debug message.

I don't agree with that statement. If that would be true, we could
remove a lot of warnings from ath10k. We have these warnings to catch
problems early, which again improves the quality of the driver.

Your commit log was again missing the "why?" part. I assume the reason
for this patch is the problem of seeing the warning "unknown peer id 2"
when putting the interface is down, which again is a spurious event from
the firmware? You should document that in the commit log as well as add
a short comment to the code explaining why we only print a debug message
when that happens.

Other idea I had would be to keep the warning message but add a new test
to detect this problematic case, but I guess for that we would need to
add a new state "stopping" to catch that? For example, something like
this:

if state == stopping and event->id == 2
        dbg("foo")
else
        warn("bar")

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
