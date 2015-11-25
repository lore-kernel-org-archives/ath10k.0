Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1bwg-0002u8-JL
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 15:25:23 +0000
Received: by wmvv187 with SMTP id v187so262178939wmv.1
 for <ath10k@lists.infradead.org>; Wed, 25 Nov 2015 07:25:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <loom.20151125T155720-404@post.gmane.org>
References: <loom.20151125T155720-404@post.gmane.org>
Date: Wed, 25 Nov 2015 16:25:00 +0100
Message-ID: <CA+BoTQ=jvtYLVD9BKSc+rs9bPM7OFStRHSxXmYPsEWFOA1nYHA@mail.gmail.com>
Subject: Re: adding QCA6174 chipset support to 3.10 kernel
From: Michal Kazior <michal.kazior@tieto.com>
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
To: "bartlomiej.grzeskowiak" <bartlomiej.grzeskowiak@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 25 November 2015 at 16:01, bartlomiej.grzeskowiak
<bartlomiej.grzeskowiak@gmail.com> wrote:
> Hi,
>
> Our embedded device works with 3.10 kernel. Since it is not within our
> responsibility it is not easy to upgrade the whole kernel. We would like to
> use the WLAN card with QCA6174 chipset.
>
> I have found out, that QCA6174 chipset is first supported in 3.20 kernel.
> ath10k driver that services this chipset is first introduced in 3.11.
>
> What would you recommend to achieve it ?

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports

You might also want to take a look at how OpenWRT deals with the very
same problem.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
