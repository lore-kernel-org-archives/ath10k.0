Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avNFM-0006kA-7f
 for ath10k@lists.infradead.org; Wed, 27 Apr 2016 11:03:09 +0000
Received: by mail-yw0-x243.google.com with SMTP id i22so9084911ywc.1
 for <ath10k@lists.infradead.org>; Wed, 27 Apr 2016 04:02:46 -0700 (PDT)
From: gloudon.jamie@gmail.com
Date: Wed, 27 Apr 2016 07:02:35 -0400
Subject: Re: Missing QCA6174 card in board-2.bin
Message-ID: <20160427110235.GA1799@darkstar.example.net>
References: <CAE5PP10CJ=n8qghc4a1yi7TjdYU3b2C_-dxXFqyZWCLT8KmV0Q@mail.gmail.com>
 <CAE5PP11M+97YrMMW2uePi4caNZwiPN+QDdn9e1Nx9mNEBgNQ_w@mail.gmail.com>
 <20160426224003.GA6906@darkstar.example.net>
 <CA+BoTQnDraR4f8qA5eBsMh3nOAz6ZEHof=uBp+UsUM57hCkrZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQnDraR4f8qA5eBsMh3nOAz6ZEHof=uBp+UsUM57hCkrZA@mail.gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Apr 27, 2016 at 07:17:44AM +0200, Michal Kazior wrote:
> On 27 April 2016 at 00:40,  <gloudon.jamie@gmail.com> wrote:
> > Hey,
> >     The board-2.bin file is missing subsystem 168c:3344 for my qca6174
> > hw ver 2.1. Does the kvalo's firmware repo requires an update?
> 
> Hi,
> 
> Is it 6174 or 6164?
> 
> There is already a subsystem vendor entry matching this:
> 
> ; strings board-2.bin  | grep bus | grep 3344
> bus=pci,vendor=168c,device=0041,subsystem-vendor=168c,subsystem-device=3344m
> bus=pci,vendor=168c,device=003e,subsystem-vendor=17aa,subsystem-device=3344m
> 
> Can you specify what your device's vid/pid and susystem vid/pid are, please?
> 
> 
> Michal

Here is both the device and subsystem's vid/pid below.

Device [168c:003e] (rev 20), Subsystem: Device [168c:3344]

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
