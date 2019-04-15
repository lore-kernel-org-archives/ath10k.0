Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxVj-0008P2-Ss
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 09:02:46 +0000
Date: Mon, 15 Apr 2019 11:02:32 +0200
From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 1/4] lib/hexdump.c: Allow 64 bytes per line
Message-ID: <20190415090232.3ualhrt5ssrb2ixq@pathway.suse.cz>
References: <20190410031720.11067-1-alastair@au1.ibm.com>
 <20190410031720.11067-2-alastair@au1.ibm.com>
 <20190412134802.kprel2c2iqijd4ai@pathway.suse.cz>
 <092f01d4f186$8e9e7cd0$abdb7670$@d-silva.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <092f01d4f186$8e9e7cd0$abdb7670$@d-silva.org>
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
Cc: linux-fbdev@vger.kernel.org, 'Stanislaw Gruszka' <sgruszka@redhat.com>, 'David Airlie' <airlied@linux.ie>, 'Joonas Lahtinen' <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, 'Jassi Brar' <jassisinghbrar@gmail.com>, ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org, 'Jose Abreu' <Jose.Abreu@synopsys.com>, 'Tom Lendacky' <thomas.lendacky@amd.com>, "'James E.J. Bottomley'" <jejb@linux.ibm.com>, 'Jani Nikula' <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org, 'Steven Rostedt' <rostedt@goodmis.org>, 'Rodrigo Vivi' <rodrigo.vivi@intel.com>, 'Benson Leung' <bleung@chromium.org>, 'Kalle Valo' <kvalo@codeaurora.org>, 'Karsten Keil' <isdn@linux-pingi.de>, "'Martin K. Petersen'" <martin.petersen@oracle.com>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>, 'Daniel Vetter' <daniel@ffwll.ch>, netdev@vger.kernel.org, 'Enric Balletbo i Serra' <enric.balletbo@collabora.com>, 'Andrew Morton' <akpm@linux-foundation.org>, "'David S. Miller'" <davem@davemloft.net>, 'Alexander Viro' <viro@zeniv.linux.org.uk>

On Sat 2019-04-13 09:22:05, Alastair D'Silva wrote:
> > -----Original Message-----
> > From: Petr Mladek <pmladek@suse.com>
> > Sent: Friday, 12 April 2019 11:48 PM
> > To: Alastair D'Silva <alastair@au1.ibm.com>
> > Cc: alastair@d-silva.org; Jani Nikula <jani.nikula@linux.intel.com>;
> Joonas
> > Lahtinen <joonas.lahtinen@linux.intel.com>; Rodrigo Vivi
> > <rodrigo.vivi@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> > <daniel@ffwll.ch>; Karsten Keil <isdn@linux-pingi.de>; Jassi Brar
> > <jassisinghbrar@gmail.com>; Tom Lendacky <thomas.lendacky@amd.com>;
> > David S. Miller <davem@davemloft.net>; Jose Abreu
> > <Jose.Abreu@synopsys.com>; Kalle Valo <kvalo@codeaurora.org>;
> > Stanislaw Gruszka <sgruszka@redhat.com>; Benson Leung
> > <bleung@chromium.org>; Enric Balletbo i Serra
> > <enric.balletbo@collabora.com>; James E.J. Bottomley
> > <jejb@linux.ibm.com>; Martin K. Petersen <martin.petersen@oracle.com>;
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Alexander Viro
> > <viro@zeniv.linux.org.uk>; Sergey Senozhatsky
> > <sergey.senozhatsky@gmail.com>; Steven Rostedt <rostedt@goodmis.org>;
> > Andrew Morton <akpm@linux-foundation.org>; intel-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org; netdev@vger.kernel.org;
> > ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; linux-
> > scsi@vger.kernel.org; linux-fbdev@vger.kernel.org;
> > devel@driverdev.osuosl.org; linux-fsdevel@vger.kernel.org
> > Subject: Re: [PATCH 1/4] lib/hexdump.c: Allow 64 bytes per line
> > 
> > On Wed 2019-04-10 13:17:17, Alastair D'Silva wrote:
> > > From: Alastair D'Silva <alastair@d-silva.org>
> > >
> > > With modern high resolution screens, we can display more data, which
> > > makes life a bit easier when debugging.
> > 
> > I have quite some doubts about this feature.
> > 
> > We are talking about more than 256 characters per-line. I wonder if such a
> > long line is really easier to read for a human.
> 
> It's basically 2 separate panes of information side by side, the hexdump and
> the ASCII version.
> 
> I'm using this myself when dealing with the pmem labels, and it works quite
> nicely.

I am sure that it works for you. But I do not believe that it
would be useful in general.


> > I am not expert but there is a reason why the standard is 80 characters
> per-
> > line. I guess that anything above 100 characters is questionable.
> > https://en.wikipedia.org/wiki/Line_length
> > somehow confirms that.
> > 
> > Second, if we take 8 pixels per-character. Then we need
> > 2048 to show the 256 characters. It is more than HD.
> > IMHO, there is still huge number of people that even do not have HD
> display,
> > especially on a notebook.
> 
> The intent is to make debugging easier when dealing with large chunks of
> binary data. I don't expect end users to see this output.

How is it supposed to be used then? Only by your temporary patches?

Best Regards,
Petr

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
