Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ7rP-0001mY-Mq
 for ath10k@lists.infradead.org; Wed, 23 Oct 2013 23:29:08 +0000
Message-ID: <52685BA1.5020801@candelatech.com>
Date: Wed, 23 Oct 2013 16:28:33 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k hits warning in sta_info.c:839.
References: <5266C321.7000103@candelatech.com>
 <5266FAAD.3010800@candelatech.com>
 <CA+BoTQmomxywSjUB9nrniMT+HeZeBD=L3m2K8c=m6ehGcSp7eQ@mail.gmail.com>
In-Reply-To: <CA+BoTQmomxywSjUB9nrniMT+HeZeBD=L3m2K8c=m6ehGcSp7eQ@mail.gmail.com>
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
Cc: ath10k@lists.infradead.org

On 10/23/2013 12:42 AM, Michal Kazior wrote:

> Yup. This originates from the firmware limitation. It's unable to
> handle two peer nodes with same mac addr on different vdevs. That's
> why it's impossible to associate 2 (or more) station interfaces to the
> same BSS.

I'm hoping to fix that soon.  From what I can tell, the firmware is actually
crashing, not just asserting.  I can find the 'program counter' in the firmware
crash dump, but I am still working on how to get some sort of stack trace
or source code location out of that.

In case it helps someone else, I believe the register dump lines:

ath10k: target Register Dump
ath10k: [00]: 0x4100016C 0x00000000 0x0098B7DA 0x00000000

decode as:  Target, Line (if assert), ProgramCounter(PC), bad-virtual-addr


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
