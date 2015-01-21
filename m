Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDknj-0002DH-Ng
 for ath10k@lists.infradead.org; Wed, 21 Jan 2015 02:13:48 +0000
Message-ID: <54BF0B42.7050101@dd-wrt.com>
Date: Wed, 21 Jan 2015 03:13:22 +0100
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
MIME-Version: 1.0
References: <54BECE4D.9020308@candelatech.com>
In-Reply-To: <54BECE4D.9020308@candelatech.com>
Subject: Re: More than one ath10k NIC in 3.19.0-rc5?
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
To: ath10k@lists.infradead.org

Am 20.01.2015 um 22:53 schrieb Ben Greear:
> I tried running a patched version of 3.19.0-rc5 kernel, and it seems to work
> fine when there is one ath10k NIC in the system, but when there is two it
> doesn't try to load the firmware.
>
> Hacked 3.17.8+ works fine.
>
> Anyone tried more than one ath10k NIC in 3.19 kernel?
>
> Thanks,
> Ben
standard x86 system? i just can say that with 3.18 i have big troubles 
with the new pci bus code introduced on several embedded devices.
so maybe the reason is here?
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
