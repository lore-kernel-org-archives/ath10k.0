Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auiKx-0005Fy-1r
 for ath10k@lists.infradead.org; Mon, 25 Apr 2016 15:22:11 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [OpenWrt-Devel] How to initialize multiple phy radios
Date: Mon, 25 Apr 2016 15:21:45 +0000
Message-ID: <87potd3e9j.fsf@kamboji.qca.qualcomm.com>
References: <CA+i30h-5GCJ0h9REAJE8TCdxNQDe8Sa=Fs=gbxpHEW3fOY-hMw@mail.gmail.com>
 <CA+i30h--nmpjeNK4S02a9o9qrQ-b3QR77WcRorxC5-Dame5hBw@mail.gmail.com>
 <CA+i30h-Y_rB0kZfgWifk14Zw1CCkGZH5x5zf8+OH-GTwswXh3w@mail.gmail.com>
 <2596438.Cv6xmiar05@debian64>
In-Reply-To: <2596438.Cv6xmiar05@debian64> (Christian Lamparter's message of
 "Sun, 24 Apr 2016 12:48:39 +0200")
Content-Language: en-US
Content-ID: <F1F02FE92B5B9440BD3D3201C013C000@qualcomm.com>
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: David Hutchison <dhutchison@bluemesh.net>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Christian Lamparter <chunkeey@googlemail.com> writes:

> On Sunday, April 24, 2016 01:16:11 AM David Hutchison wrote:
>> I spoke too soon:
>> https://pci-ids.ucw.cz/read/PC/168c/0050
>> 
>> It is the QCA9887, so it's definitely on the PCIe bus and is being
>> seen.
>
> Does ath10k support the QCA9887? I see no entry for this pci-id (168c:0050)
> in ath10k's pci table [0] and there's no definition of it in the hardware
> header either [1]. The chip-id is also not present. I CC'ed ath10k, since
> this seems to be a new chip that might be easy to add.

Currently ath10k does not support QCA9887.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
