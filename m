Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8UWD-0002Io-D7
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 15:26:45 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Bug 119151 - [regression] ath10k no longer authenitcates and
 freezes system
Date: Thu, 2 Jun 2016 15:26:15 +0000
Message-ID: <87k2i7y5m2.fsf@kamboji.qca.qualcomm.com>
References: <8760trzoiw.fsf@kamboji.qca.qualcomm.com>
 <871t4fzn1x.fsf@kamboji.qca.qualcomm.com>	<57504F05.3040200@candelatech.com>
In-Reply-To: <57504F05.3040200@candelatech.com> (Ben Greear's message of "Thu, 
 2 Jun 2016 08:21:41 -0700")
Content-Language: en-US
Content-ID: <63F413DC8E6FF84C817C2DE1E3215B3F@qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "mike@fireburn.co.uk" <mike@fireburn.co.uk>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> I found a lot of problems with this code as well, and the 5 patches
> starting from the URL below fixed the issues for me.
>
> They are stuck as 'NA' in patchwork, but I don't know why.
>
> http://lists.infradead.org/pipermail/ath10k/2016-April/007218.html

ath10k has a separate patchwork instance, did you look at the correct
one? I have quite a lot of patches from you in deferred state because of
the patch bomb, but I'm hoping to go through them soon.

https://patchwork.kernel.org/project/ath10k/list/?state=10&delegate=25621&order=date

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
