Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAJ0t-0006GJ-SG
 for ath10k@lists.infradead.org; Thu, 02 Nov 2017 17:10:45 +0000
Received: by mail-io0-x244.google.com with SMTP id h70so534564ioi.4
 for <ath10k@lists.infradead.org>; Thu, 02 Nov 2017 10:10:23 -0700 (PDT)
Date: Thu, 2 Nov 2017 10:10:18 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: move pci suspend/resume functions
Message-ID: <20171102171017.GA11081@google.com>
References: <20171102110903.2886660-1-arnd@arndb.de>
 <87mv44ln5v.fsf@qca.qualcomm.com>
 <CAK8P3a2xkh19gocctXf4gv1Km_SaYJPbSC5QkkZ0WMQQAXp83Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2xkh19gocctXf4gv1Km_SaYJPbSC5QkkZ0WMQQAXp83Q@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Govind Singh <govinds@qti.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Colin Ian King <colin.king@canonical.com>, Ben Greear <greearb@candelatech.com>, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

On Thu, Nov 02, 2017 at 04:40:57PM +0100, Arnd Bergmann wrote:
> On Thu, Nov 2, 2017 at 4:23 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> > Brian has already fixed this, please check that:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=20665a9076d48e9abd9a2db13d307f58f7ef6647
> >
> > But apparently I forgot to merge ath-next to wireless-drivers-next, will
> > do that soon.
> 
> Yes, Brian's version is better. I considered the same, but wasn't sure
> it was safe.

Yes, it's safe. The code is still basically dead, since the mac80211 ops
get dropped with !CONFIG_PM (so no one calls the
*_hif_{suspend,resume}() functions), but at least we have fewer
#ifdef's.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
