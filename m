Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from up.icubehost.com ([185.62.36.194])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYolS-00059C-FU
 for ath10k@lists.infradead.org; Tue, 09 Jan 2018 07:56:10 +0000
MIME-Version: 1.0
Date: Tue, 09 Jan 2018 13:24:59 +0530
From: Alagu Sankar <alagusankar@silex-india.com>
Subject: Re: QCA6174 SDIO support?
In-Reply-To: <20180108030044.3f5e575a@nic.cz>
References: <20180108012851.389d37c7@nic.cz>
 <37ba258c-77f6-eb05-0d50-5ecab93cf040@dd-wrt.com>
 <20180108030044.3f5e575a@nic.cz>
Message-ID: <a0bec96a6ca758c940848abda75306f7@silex-india.com>
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
To: Marek Behun <marek.behun@nic.cz>
Cc: ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>


On 2018-01-08 07:30, Marek Behun wrote:
> This branch is almost the same as mine (orig + high latency patches +
> sdio patches), therefore no QCA6174 SDIO node in ath10k_hw_params_list.
> 
> On Mon, 8 Jan 2018 02:31:59 +0100
> Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:
> 
>> try this branch
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath10k-pending-sdio-usb
>> 
>> Am 08.01.2018 um 01:28 schrieb Marek Behun:
>> > Hello,
>> >
>> > we at CZ.NIC are trying the current ath10k driver with High Latency
>> > + SDIO support (which was done by Silex Technology) on our board.
>> > The supported chip, QCA9377, works, but we only have 1x1 MIMO
>> > boards with this chip. We are trying to get it work with 8274B-SR
>> > (QCA6174)
>> > ( http://www.fn-link.com/a-b-g-n-ac-wi-fi-bt-module/8274b-sr.html )
>> >
>> > There is already some code in sdio.c mentoining QCA6174, but there
>> > are no nodes in ath10k_hw_params. Because QCA6174 is supported via
>> > PCI bus, I tried to write the ath10k_hw_params node (see patch
>> > http://blackhole.sk/~kabel/src/qca6174.patch ) but do not know if
>> > the changes I did are enough, because the driver fails after loading
>> > firmware.
>> >
>> > And the firmware is another point: Does board-sdio.bin have to be
>> > different from board.bin? Do we have to create this binary
>> > ourselves, or should the 8274B-SR board manufacturer sent us one?
>> > (We didn't receive anything from fn-link.)
board-sdio.bin is nothing but the board.bin variant used by SDIO 
modules. Check with the board/module vendor for the board.bin. This is 
one possible cause for the firmware assert.
>> >
>> > Any information is good, please let us know even if you have NDA on
>> > this and therefore cannot give any more information about this.
>> >
>> > Thank you.
>> >
>> > Marek Behun, CZ.NIC
>> >
>> > _______________________________________________
>> > ath10k mailing list
>> > ath10k@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/ath10k
>> >
>> 
> 
You also need to get the firmware-x.bin for QCA6174 SDIO module. I do 
not think that the PCIe firmware of QCA6174 or the SDIO firmware of 
QCA9377 would be compatible with this. If you do not have one, probably 
this information from Erik 
(https://github.com/erstrom/linux-ath/wiki/Firmware) would be of some 
help.

Regards,
Alagu Sankar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
