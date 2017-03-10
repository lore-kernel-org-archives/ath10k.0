Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmLCC-0004PG-1R
 for ath10k@lists.infradead.org; Fri, 10 Mar 2017 14:07:06 +0000
Received: by mail-ot0-x234.google.com with SMTP id 19so77270158oti.0
 for <ath10k@lists.infradead.org>; Fri, 10 Mar 2017 06:06:43 -0800 (PST)
MIME-Version: 1.0
From: Chris Price <chris.price@dejero.com>
Date: Fri, 10 Mar 2017 09:06:42 -0500
Message-ID: <CALJ2kaHVmmZ9HK_=pEDEQ33gCB+w6+oZ3j3rx-U2ZO9aG2CWmw@mail.gmail.com>
Subject: Re: How to integrate the latest ath10k driver into an older kernel
 release ?
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
To: ath10k@lists.infradead.org

I had similar problems doing the same thing with a 4.1 kernel. I'm not
sure if you are having the same problem without seeing the compilation
errors, but here is what worked for me:

- Used linux-stable repo
- Used the copy-list.ath file from
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports
- Added the following files to copy-list.ath: include/net/codel.h,
include/net/codel_impl.h, include/net/fq.h, include/net/fq_impl.h
- Ensure you compile using the same compiler as was used to compile
your kernel. Otherwise, I couldn't compile one of the arch modules and
the 'mcount' symbol couldn't be found.

YMMV

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
