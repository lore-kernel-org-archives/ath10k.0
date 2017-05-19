Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBeWF-0008PT-PY
 for ath10k@lists.infradead.org; Fri, 19 May 2017 09:48:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add configurable debugging.
Date: Fri, 19 May 2017 09:47:45 +0000
Message-ID: <87o9upuqip.fsf@kamboji.qca.qualcomm.com>
References: <20170510162546.15439-1-adrian@freebsd.org>
In-Reply-To: <20170510162546.15439-1-adrian@freebsd.org> (Adrian Chadd's
 message of "Wed, 10 May 2017 09:25:46 -0700")
Content-Language: en-US
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Adrian Chadd <adrian@freebsd.org> writes:

> This adds a few configurable debugging options:
>
> * driver debugging and tracing is now configurable per device
> * driver debugging and tracing is now configurable at runtime
> * the debugging / tracing is not run at all (besides a mask check)
>   unless the specific debugging bitmap field is configured.
>
> Signed-off-by: Adrian Chadd <adrian@FreeBSD.org>

ath10k-check found some trivial whitespace problems:

drivers/net/wireless/ath/ath10k/debug.h:207: return is not a function, parentheses are not required
drivers/net/wireless/ath/ath10k/debug.h:209: return is not a function, parentheses are not required
drivers/net/wireless/ath/ath10k/debug.h:210: return is not a function, parentheses are not required
drivers/net/wireless/ath/ath10k/debug.h:214: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/debug.h:218: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/debug.c:2430: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/debug.c:2430: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/debug.c:2431: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/debug.c:2431: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/debug.c:2464: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/debug.c:2464: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/debug.c:2465: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/debug.c:2465: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/debug.c:2493: Please don't use multiple blank lines
drivers/net/wireless/ath/ath10k/debug.c:2525: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
drivers/net/wireless/ath/ath10k/debug.c:2527: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
drivers/net/wireless/ath/ath10k/debug.c:2620: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/debug.c:2640: Alignment should match open parenthesis

I fixed those in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=bd8c3bdce70adc201037b2eb7eda0a83911ef375

I'll look at this more closely later.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
