Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkpqJ-0006AU-3d
 for ath10k@lists.infradead.org; Thu, 15 May 2014 07:12:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: support get/set antenna configurations.
References: <5370F41A.70202@candelatech.com>
 <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <87y4y5h7mc.fsf@kamboji.qca.qualcomm.com>
 <53726148.3090503@candelatech.com>
 <CAHqTa-111nY-nqiU99HkwAermVEE8zotVFg3VDA4AMtZyCKUcw@mail.gmail.com>
 <87mwekh7ds.fsf@kamboji.qca.qualcomm.com>
 <CAEFj9861oYh=RDOxSgLev0L713dQnzez+1ja5duufAdhTJ4jKA@mail.gmail.com>
Date: Thu, 15 May 2014 10:11:54 +0300
In-Reply-To: <CAEFj9861oYh=RDOxSgLev0L713dQnzez+1ja5duufAdhTJ4jKA@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Thu, 15 May 2014 12:04:43 +0800")
Message-ID: <87ha4rbjnp.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

> Sorry for all the noise. The patch is indeed working.
>
> I have verified that the number of spatial streams are reduced
> accordingly if you reduce the tx chainmask.

Nice! Thanks for testing this, it always good to hear from other users
(than the original patch author) if a new feature is working or not.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
