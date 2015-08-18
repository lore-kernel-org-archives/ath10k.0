Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRf6r-0004x3-O0
 for ath10k@lists.infradead.org; Tue, 18 Aug 2015 11:31:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 1/2] ath10k: add qca6164 support
References: <1439469147-9408-1-git-send-email-michal.kazior@tieto.com>
 <1439469147-9408-2-git-send-email-michal.kazior@tieto.com>
Date: Tue, 18 Aug 2015 14:30:46 +0300
In-Reply-To: <1439469147-9408-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 13 Aug 2015 14:32:26 +0200")
Message-ID: <87d1ykdeah.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: arnd@arndb.de, linux-wireless@vger.kernel.org, twilightrook@gmail.com, ath10k@lists.infradead.org, oscarrydberg@gmail.com, vvanpo@gmail.com, joseph.salisbury@canonical.com

Michal Kazior <michal.kazior@tieto.com> writes:

> This adds additional 0x0041 PCI Device ID
> definition to ath10k for QCA6164 which is a 1
> spatial stream sibling of the QCA6174 (which is 2
> spatial stream chip).
>
> The QCA6164 needs a dedicated board.bin file which
> is different than the one used for QCA6174. If the
> board.bin is wrong the device will crash early
> while trying to boot firmware. The register dump
> will look like this:
>
>  ath10k_pci 0000:02:00.0: firmware register dump:
>  ath10k_pci 0000:02:00.0: [00]: 0x05010000 0x000015B3 0x000A012D 0x00955B31
>  ...
>
> Note the value 0x000A012D.
>
> Special credit goes to Alan Liu
> <alanliu@qca.qualcomm.com> for providing support
> help which enabled me to come up with this patch.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

As neither Michal nor me have QCA6174 and I'm reluctant to take untested
patches, it would be great if someone could test this and tell us how it
went. That way I feel safer to apply this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
