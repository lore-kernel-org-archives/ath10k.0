Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG9bI-00084w-51
 for ath10k@lists.infradead.org; Wed, 31 May 2017 19:48:14 +0000
Received: by mail-wm0-x22d.google.com with SMTP id d127so33109335wmf.0
 for <ath10k@lists.infradead.org>; Wed, 31 May 2017 12:47:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <35449B299288584097A15B3FEB9C3E582578710584@SBS-GHMT.ghmt.local>
References: <35449B299288584097A15B3FEB9C3E5825786B4500@SBS-GHMT.ghmt.local>
 <6cadea3f-b386-7fc2-9295-720ced82631d@candelatech.com>
 <CAJ-VmontSGS9yBCRKJu7kkjrmG6zkYV47YH6vRSpUqyUEj2nvw@mail.gmail.com>
 <35449B299288584097A15B3FEB9C3E582578710584@SBS-GHMT.ghmt.local>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 31 May 2017 12:47:48 -0700
Message-ID: <CAJ-Vmo=-mcob1dEv4i2EWJ2whh2tBwF7J+EO-XpBcRMZXNULbA@mail.gmail.com>
Subject: Re: is it possible to enable dualband or even 2.4 GHz on QCA9994?
 (Compex WLE1216V5-20)
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
To: "Lindner, Frank" <Frank.Lindner@ghmt.de>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 30 May 2017 at 22:23, Lindner, Frank <Frank.Lindner@ghmt.de> wrote:
> Hi.
> 9994 is Cascade, which should be 2.4 GHz capable as fas as Qualcomm is correct on their specs site.
> Question was not, which other card can do 2.4 GHz. I want to enable 2.4 GHz / dualband mode via some registers or what ever on this card.
> Where can I find the calbration files  you've mentioned?

Hi,

I /think/ cascade doesn't have the ability to run dual mode. It's
designed to either be 2G or 5G, and not both like STA mode. I'd have
to go check.

(I think I ran over this issue at work recently..)


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
