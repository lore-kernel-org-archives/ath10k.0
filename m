Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDUH0-00066r-Go
 for ath10k@lists.infradead.org; Sat, 02 Aug 2014 08:02:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix wmi service bitmap debug
References: <1406628239-31322-1-git-send-email-michal.kazior@tieto.com>
 <87k36r5ra2.fsf@kamboji.qca.qualcomm.com>
 <1406962776.1835.3.camel@joe-AO725>
Date: Sat, 2 Aug 2014 11:02:08 +0300
In-Reply-To: <1406962776.1835.3.camel@joe-AO725> (Joe Perches's message of
 "Fri, 1 Aug 2014 23:59:36 -0700")
Message-ID: <87fvhf5ngf.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Joe Perches <joe@perches.com> writes:

>> This introduces a new checkpatch warning:
>> 
>> drivers/net/wireless/ath/ath10k/wmi.h:214: ERROR: spaces required around that ':' (ctx:VxE)
>> 
>> But I think that's just a false warning and I should ignore it. Any
>> other ideas?
>
> I don't get a warning with this patch.
>
> What's the last git commit id of the checkpatch version
> you used?

I was using a pretty old version of checkpatch (I have a local copy of
it) but now I updated it to commit ae3ccc4678. I still see the warning
plus a new fallthrough warning (see below).

> $ ./scripts/checkpatch.pl --strict ath10k.diff  
> total: 0 errors, 0 warnings, 0 checks, 471 lines checked

With that command line I don't see it either. But normally I use -f and
that's when I see it:

$ scripts/checkpatch.pl --strict --ignore NETWORKING_BLOCK_COMMENT_STYLE,PARENTHESIS_ALIGNMENT -f drivers/net/wireless/ath/ath10k/wmi.h
ERROR: spaces required around that ':' (ctx:VxE)
#214: FILE: drivers/net/wireless/ath/ath10k/wmi.h:214:
+       default:
               ^

WARNING: Possible switch case/default not preceeded by break or fallthrough comment
#214: FILE: drivers/net/wireless/ath/ath10k/wmi.h:214:
+       default:

total: 1 errors, 1 warnings, 0 checks, 4803 lines checked

NOTE: Ignored message types: NETWORKING_BLOCK_COMMENT_STYLE PARENTHESIS_ALIGNMENT

drivers/net/wireless/ath/ath10k/wmi.h has style problems, please review.

If any of these errors are false positives, please report
them to the maintainer, see CHECKPATCH in MAINTAINERS.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
