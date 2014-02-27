Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ3D0-00024w-HP
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 15:49:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Missing memory barriers
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
Date: Thu, 27 Feb 2014 17:48:46 +0200
In-Reply-To: <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 (Avery Pennarun's message of "Sun, 9 Feb 2014 03:00:45 -0500")
Message-ID: <8738j4ftep.fsf_-_@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Avery,

starting a new thread about memory barriers:

Avery Pennarun <apenwarr@gmail.com> writes:

> On Wed, Jan 29, 2014 at 9:41 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
>
> - there are definitely some missing memory barriers in here; in a few
> cases you can clearly see a write getting done before the read that
> came before it.  Looking at the definitions for iowrite32 and
> ioread32, and for rmb() and wmb(), we can see that the use of rmb()
> and wmb() do not work properly (at least on ARM) when you care about
> the ordering between reads and writes.  However, I don't think this
> actually causes the problem.

Can you tell more about this, please? Did you find out where we are
actually doing it wrong?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
