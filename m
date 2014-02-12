Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDNq3-00018J-UL
 for ath10k@lists.infradead.org; Wed, 12 Feb 2014 00:38:08 +0000
Received: by mail-ie0-f170.google.com with SMTP id lx4so1093964iec.15
 for <ath10k@lists.infradead.org>; Tue, 11 Feb 2014 16:37:46 -0800 (PST)
Date: Tue, 11 Feb 2014 17:31:43 -0700
From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/3] ath10k: Get rid of superfluous call to
 pci_disable_msi()
Message-ID: <20140212003143.GD21057@google.com>
References: <cover.1389904166.git.agordeev@redhat.com>
 <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
 <20140130134819.GA31909@dhcp-26-207.brq.redhat.com>
 <87y51qohjn.fsf@kamboji.qca.qualcomm.com>
 <20140204190935.GA1430@dhcp-26-207.brq.redhat.com>
 <8761oum0l3.fsf@kamboji.qca.qualcomm.com>
 <20140205085047.GA27820@dhcp-26-207.brq.redhat.com>
 <871tzilz1u.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871tzilz1u.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-pci@vger.kernel.org, Alexander Gordeev <agordeev@redhat.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On Wed, Feb 05, 2014 at 10:54:37AM +0200, Kalle Valo wrote:
> Alexander Gordeev <agordeev@redhat.com> writes:
> 
> > On Wed, Feb 05, 2014 at 10:21:28AM +0200, Kalle Valo wrote:
> >> Is it ok for me to take these patches to my ath.git tree or would you
> >> prefer to route them some other way?
> >
> > Yeah, Bjorn has indicated he would pull it to his tree.
> 
> Ok, I'll drop these from my pending branch then. I just think it would
> have been easier if I would take these, smaller chance of conflicts that
> way.
> 
> > I get it you are fine with 2/3 and 3/3?
> 
> Yes, with the addition of the commit log to 1/3 I'll give:
> 
> Acked-by: Kalle Valo <kvalo@qca.qualcomm.com>

I haven't put these in my branch, so you can take them.

Alexander has a whole batch of network driver updates that I think David
Miller is going to apply; would it make sense to include these in that
batch?

There's also the wil6210 patch for
drivers/net/wireless/ath/wil6210/pcie_bus.c, which seems like it maybe
could be in that batch, too.

Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
