Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEhxU-0008I8-3S
 for ath10k@lists.infradead.org; Tue, 05 Aug 2014 16:51:33 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: [PATCHv5 0/2] ath10k spectral scan support
Date: Tue, 5 Aug 2014 18:51:06 +0200
References: <1406899034-13473-1-git-send-email-sw@simonwunderlich.de>
 <CAB=NE6XOquKeF3JTCDBUJhtjtUYGjPi2tG7By+1Ntyk-_Km6rg@mail.gmail.com>
In-Reply-To: <CAB=NE6XOquKeF3JTCDBUJhtjtUYGjPi2tG7By+1Ntyk-_Km6rg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201408051851.06457.sw@simonwunderlich.de>
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
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: mathias.kretschmer@fokus.fraunhofer.de, Kathy Giori <kgiori@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org


> On Fri, Aug 1, 2014 at 6:17 AM, Simon Wunderlich <sw@simonwunderlich.de> 
wrote:
> > To view the samples, please have a look at the fft_eval tool [1] which
> > now supports both ath9k and ath10k formats.
> 
> Can you please edit the ath9k and ath10k wiki about this tool and
> reference to it?

Thanks for pointing that out. I've updated ath9k with some instructions how to 
actually run the spectral scan. A link to the tool was already included. I've 
also added an ath10k page with test instructions and description of the 
debugfs files, including a reference to fft_eval. Feel free to 
update/improve/edit, everyone. :)

I did not update the iw page because there is (no longer) any changes 
neccesary in iw for running spectral - we had this only in the very first 
version of the ath9k patch. I've updated the README/usage in fft_eval to 
reflect that properly, though.

Thanks,
    Simon

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
