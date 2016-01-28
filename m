Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOi6Y-0007ul-T7
 for ath10k@lists.infradead.org; Thu, 28 Jan 2016 08:39:04 +0000
Received: by mail-yk0-x22a.google.com with SMTP id v14so22645601ykd.3
 for <ath10k@lists.infradead.org>; Thu, 28 Jan 2016 00:38:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnjcdZxN39zt5XnrduBmUdgJpwuwh-sVOzw9HMGFdZeeA@mail.gmail.com>
References: <20160128045052.M14316@universe.cdotb.ernet.in>
 <20160128055132.M19451@cdot.in>
 <CA+BoTQnjcdZxN39zt5XnrduBmUdgJpwuwh-sVOzw9HMGFdZeeA@mail.gmail.com>
Date: Thu, 28 Jan 2016 09:38:41 +0100
Message-ID: <CANCHnQpr5=-1UmRz1TSBAfqoUic1HWEX86vfFom59FcYoca71A@mail.gmail.com>
Subject: Re: Issues with Compex WLE900VX in 80211AC mode
From: Jeroen Roovers <jeroen.roovers@airfi.aero>
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
Cc: B R Manjula <brm@cdot.in>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 28 January 2016 at 07:42, Michal Kazior <michal.kazior@tieto.com> wrote:

> This seems to be a common problem these days, see:
>
>   http://lists.infradead.org/pipermail/ath10k/2016-January/006723.html

I didn't have a chance to properly work out what is going on there,
but the suggested patch did not allow me to select an ac channel,
returning the same error seen in the attachment.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
