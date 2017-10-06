Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr50045.outbound.protection.outlook.com ([40.107.5.45]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0XDD-0004Ot-8u
 for ath10k@lists.infradead.org; Fri, 06 Oct 2017 18:19:05 +0000
Subject: Re: mesh point and ap mode on same interface
References: <e6b02c56-38c7-323e-2bc9-e2b4276b654c@tu-bs.de>
 <cc8baced-bd74-5703-d885-6ec444eb62ce@candelatech.com>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <43bf6a27-be58-35e4-26fa-5e6b380353ac@bowerswilkins.com>
Date: Fri, 6 Oct 2017 11:18:29 -0700
MIME-Version: 1.0
In-Reply-To: <cc8baced-bd74-5703-d885-6ec444eb62ce@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, "Harms, Hannes" <hannes.harms@tu-bs.de>, ath10k@lists.infradead.org

I have tried t bring up the ap interface with iw / hostapd,
>> after joining the mesh.
>>
>> When I start the second interface, rtnetlink responds with
>> device or resource busy.
>
If you give more details of your steps, people may help you more.
Btw, did you create a 2nd interface on the same radio and change the mac 
address?

> IBSS + AP works on the CT firmware/driver, at least,
> but our CT 10.1 (988x) firmware does not support MESH at this point.
>
> I think I had to modify the driver to relax the valid combinations check,
> and possibly the stock firmware cannot handle that.
>
> Maybe someday we'll support MESH on 988x, but to date, there has not been
> a lot of interest...
>
> http://www.candelatech.com/ath10k.php
>
> Thanks,
> Ben
>
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
