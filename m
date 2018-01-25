Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eea2q-0006UH-Ae
 for ath10k@lists.infradead.org; Thu, 25 Jan 2018 05:25:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10: Add support for Ubiquiti-branded QCA988X
Date: Thu, 25 Jan 2018 05:25:28 +0000
Message-ID: <87efmezf07.fsf@kamboji.qca.qualcomm.com>
References: <20180124194218.11408-1-tobleminer@gmail.com>
In-Reply-To: <20180124194218.11408-1-tobleminer@gmail.com> (Tobias Schramm's
 message of "Wed, 24 Jan 2018 20:42:16 +0100")
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
To: Tobias Schramm <tobleminer@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Tobias Schramm <tobleminer@gmail.com> writes:

> A lot of more modern Ubiquiti AirMAX wireless devices contain a rebranded
> QCA988X with changed PCI vendor and device id.
> This patch adds support for those chips by treating them as QCA988X rev2
> radios.
>
> Tobias Schramm (2):
>   pci: Add vendor id of Ubiquiti Networks
>   ath10k: Add support for Uiquiti rebranded QCA988X v2

Please resend (as v2) and include more lists/people:

ath10k@lists.infradead.org
linux-wireless@vger.kernel.org
Bjorn Helgaas <bhelgaas@google.com>
linux-pci@vger.kernel.org

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
