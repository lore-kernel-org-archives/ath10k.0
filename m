Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm21-vm4.bullet.mail.ne1.yahoo.com ([98.138.91.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtxzV-0007cb-VX
 for ath10k@lists.infradead.org; Mon, 09 Jun 2014 11:43:55 +0000
Message-ID: <53959DE2.7050906@yahoo.com>
Date: Mon, 09 Jun 2014 07:43:30 -0400
From: frank agius <ftagius@yahoo.com>
MIME-Version: 1.0
Subject: Re: ATH10K set bitrates problem
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 6/6/2014 2:43 PM, Janusz Dziedzic wrote:
 > On 6 June 2014 18:43, Frank Agius <ftagius@yahoo.com> wrote:
 >> I am unable to set the bitrates for devices using the ath10k driver,
 >> regardless of the arguments I pass:
 >>
 >>
 >> # iw wlan0 set bitrates legacy-2.4 6 12 24
 >> command failed: Invalid argument (-22)
 >> # iw dev wlan0 set bitrates mcs-2.4 10
 >> command failed: Invalid argument (-22)
 >>
 >>
 >> The ath10k drivers were built from stable backports v3.15-rc1.   I 
am using
 >> firmware file firmware-2.bin_999.999.0.636
 >>
 >>
 >> Is this a known issue?
 >>
 > This is expected.
 > ath10k support only single rate setting (or single nss). So, please
 > check commit message,
 > ath10k: add set_bitrate_mask callback
 >
 > Try this:
 > iw wlan0 set bitrates legacy-2.4 18 ht-mcs-2.4
 > iw wlan0 set bitrates legacy-2.4 ht-mcs-2.4 6
 > iw wlan0 set bitrates - back to default mask.


Thanks, using the bitrate option ht-mcs-2.4 instead of mcs-2.4 worked. 
Note that I did have to upgrade the iw tools package.  The version I was 
using (3.11) does not have support for bitrate option ht-mcs.  Version 
3.15 of iw tools does support the new options.

frank agius

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
