Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0184.hostedemail.com ([216.40.44.184]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdl31-0001Nd-99
 for ath10k@lists.infradead.org; Thu, 20 Jun 2019 00:35:28 +0000
Message-ID: <d8316be322f33ea67640ff83f2248fe433078407.camel@perches.com>
Subject: Re: [PATCH v3 0/7] Hexdump Enhancements
From: Joe Perches <joe@perches.com>
Date: Wed, 19 Jun 2019 17:35:01 -0700
In-Reply-To: <c68cb819257f251cbb66f8998a95c31cebe2d72e.camel@d-silva.org>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <9a000734375c0801fc16b71f4be1235f9b857772.camel@perches.com>
 <c68cb819257f251cbb66f8998a95c31cebe2d72e.camel@d-silva.org>
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
To: Alastair D'Silva <alastair@d-silva.org>
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>, Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Tom Lendacky <thomas.lendacky@amd.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Benson Leung <bleung@chromium.org>, Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, David Laight <David.Laight@ACULAB.COM>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Thu, 2019-06-20 at 09:15 +1000, Alastair D'Silva wrote:
> On Wed, 2019-06-19 at 09:31 -0700, Joe Perches wrote:
> > On Mon, 2019-06-17 at 12:04 +1000, Alastair D'Silva wrote:
> > > From: Alastair D'Silva <alastair@d-silva.org>
> > > 
> > > Apologies for the large CC list, it's a heads up for those
> > > responsible
> > > for subsystems where a prototype change in generic code causes a
> > > change
> > > in those subsystems.
> > > 
> > > This series enhances hexdump.
> > 
> > Still not a fan of these patches.
> 
> I'm afraid there's not too much action I can take on that, I'm happy to
> address specific issues though.
> 
> > > These improve the readability of the dumped data in certain
> > > situations
> > > (eg. wide terminals are available, many lines of empty bytes exist,
> > > etc).

I think it's generally overkill for the desired uses.

> > Changing hexdump's last argument from bool to int is odd.
> > 
> 
> Think of it as replacing a single boolean with many booleans.

I understand it.  It's odd.

I would rather not have a mixture of true, false, and apparently
random collections of bitfields like 0xd or 0b1011 or their
equivalent or'd defines.


> There's only a handful of consumers, I don't think there is a value-add 
> in creating more wrappers vs updating the existing callers.

Perhaps more reason not to modify the existing api.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
