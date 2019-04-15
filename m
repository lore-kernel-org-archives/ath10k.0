Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFzNz-0007nn-Ai
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 11:02:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 3/4] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
Date: Mon, 15 Apr 2019 11:03:57 +0000
Message-ID: <42fb90eb9c8f4ede8a56a09be90218e3@AcuMS.aculab.com>
References: <20190410031720.11067-1-alastair@au1.ibm.com>
 <20190410031720.11067-4-alastair@au1.ibm.com>
 <20190412141211.lvnz6wb7mwkykmxf@pathway.suse.cz>
 <093301d4f187$da0756a0$8e1603e0$@d-silva.org>
 <20190415092424.qos7d54nbyr5hphu@pathway.suse.cz>
 <0da301d4f373$01d5bb80$05813280$@d-silva.org>
 <10c791893f034c26b4fee1a4659133e5@AcuMS.aculab.com>
 <0db501d4f378$3bd50bb0$b37f2310$@d-silva.org>
In-Reply-To: <0db501d4f378$3bd50bb0$b37f2310$@d-silva.org>
Content-Language: en-US
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
To: 'Alastair D'Silva' <alastair@d-silva.org>, 'Petr Mladek' <pmladek@suse.com>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, 'Stanislaw Gruszka' <sgruszka@redhat.com>, 'David Airlie' <airlied@linux.ie>, 'Joonas Lahtinen' <joonas.lahtinen@linux.intel.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 'Jassi Brar' <jassisinghbrar@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 'Jose Abreu' <Jose.Abreu@synopsys.com>, 'Tom Lendacky' <thomas.lendacky@amd.com>, "'James E.J. Bottomley'" <jejb@linux.ibm.com>, 'Jani Nikula' <jani.nikula@linux.intel.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 'Steven Rostedt' <rostedt@goodmis.org>, 'Rodrigo Vivi' <rodrigo.vivi@intel.com>, 'Benson Leung' <bleung@chromium.org>, 'Kalle Valo' <kvalo@codeaurora.org>, 'Karsten Keil' <isdn@linux-pingi.de>, 'Alastair D'Silva' <alastair@au1.ibm.com>, "'Martin K. Petersen'" <martin.petersen@oracle.com>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>, 'Daniel Vetter' <daniel@ffwll.ch>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 'Enric Balletbo i Serra' <enric.balletbo@collabora.com>, 'Andrew Morton' <akpm@linux-foundation.org>, "'David
 S. Miller'" <davem@davemloft.net>, 'Alexander Viro' <viro@zeniv.linux.org.uk>

From: Alastair D'Silva
> Sent: 15 April 2019 11:45
...
> > Although I think you'd want a 'no hex' flag to suppress the hex.
> >
> > Probably more useful flags are ones to suppress the address column.
> 
> This is already supported by the prefix_type parameter - are you proposing that we eliminate the
> parameter & combine it with flags?

I was looking at the flags on one of my hexdump() functions...

> > I've also used flags to enable (or disable) suppression of multiple lines of
> > zeros of constant bytes.
> > In that case you may want hexdump to return the flags for the next call when
> > a large buffer is being dumped in fragments.
> 
> I'm afraid I don't quite follow here, hex_dump_to_buffer doesn't alter the flags,
> so the caller already knows it.

If you are suppressing lines of zeros and dumping a buffer in several blocks
then subsequent calls need to know that the last line of the previous call
was suppressed zeros - and carry on with the same suppressed block.

I've not looked to see if it does support suppressing lines of zeros/0xff.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
