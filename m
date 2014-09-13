Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x236.google.com ([2607:f8b0:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSbom-0000mn-J7
 for ath10k@lists.infradead.org; Sat, 13 Sep 2014 01:08:01 +0000
Received: by mail-vc0-f182.google.com with SMTP id le20so1495663vcb.13
 for <ath10k@lists.infradead.org>; Fri, 12 Sep 2014 18:07:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkr0gB_uYvRk3Za035vAcT1BhqVccVD2gR1iJXGmMpABA@mail.gmail.com>
References: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>
 <5400F497.7070904@candelatech.com>
 <CA+BoTQnhqxtHcX46-U+TjQBMDm27jM11xCJ956UFM_gjMvvs+A@mail.gmail.com>
 <5411AF6A.7010702@candelatech.com>
 <CAEFj985XJgeyX7iXaXpYGvFMFUsPndajVVGAYFqzp0P_4zp8Lw@mail.gmail.com>
 <CA+BoTQkr0gB_uYvRk3Za035vAcT1BhqVccVD2gR1iJXGmMpABA@mail.gmail.com>
Date: Sat, 13 Sep 2014 09:07:37 +0800
Message-ID: <CAEFj987FUy7UrTXz-nSCcpMQ+vYwEXTMnd3BzpJ7HEEbC5Ti8A@mail.gmail.com>
Subject: Re: [RFC] ath10k: use raw tx
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Sep 12, 2014 at 7:05 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 12 September 2014 12:41, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>
> Interesting!
>
> Can you confirm what kind of a header your unicast frames actually
> have? Do you perhaps run 4addr mode? Or maybe Data/QoS Data (2 byte
> difference at least) calculation is the problem.
>

It's a QoS Data frame. Yes (2 byte different). Probably the firmware
raw tx mode only cater for non-QoS frame?

Question, 4addr mode is allowed in adhoc mode by the firmware? No, right?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
