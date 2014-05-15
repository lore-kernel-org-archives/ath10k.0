Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkoWM-00014u-Gz
 for ath10k@lists.infradead.org; Thu, 15 May 2014 05:47:58 +0000
Received: by mail-vc0-f173.google.com with SMTP id il7so3744829vcb.32
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 22:47:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj9861oYh=RDOxSgLev0L713dQnzez+1ja5duufAdhTJ4jKA@mail.gmail.com>
References: <5370F41A.70202@candelatech.com>
 <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <87y4y5h7mc.fsf@kamboji.qca.qualcomm.com> <53726148.3090503@candelatech.com>
 <CAHqTa-111nY-nqiU99HkwAermVEE8zotVFg3VDA4AMtZyCKUcw@mail.gmail.com>
 <87mwekh7ds.fsf@kamboji.qca.qualcomm.com>
 <CAEFj9861oYh=RDOxSgLev0L713dQnzez+1ja5duufAdhTJ4jKA@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Thu, 15 May 2014 01:47:16 -0400
Message-ID: <CAHqTa-06PwRvYgf44Fym=wYMPtBUNe100H3WZGT0Bc2yYYc6Og@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support get/set antenna configurations.
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Kalle Valo <kvalo@qca.qualcomm.com>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, May 15, 2014 at 12:04 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
> Sorry for all the noise. The patch is indeed working.
>
> I have verified that the number of spatial streams are reduced
> accordingly if you reduce the tx chainmask.

Hi, can you give a hint what you might have been doing wrong during
your test, in order to help others in the future?

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
