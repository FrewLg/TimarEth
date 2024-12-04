<?php

namespace App\Repository;

use App\Entity\Downloadables;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Downloadables>
 *
 * @method Downloadables|null find($id, $lockMode = null, $lockVersion = null)
 * @method Downloadables|null findOneBy(array $criteria, array $orderBy = null)
 * @method Downloadables[]    findAll()
 * @method Downloadables[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DownloadablesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Downloadables::class);
    }

    //    /**
    //     * @return Downloadables[] Returns an array of Downloadables objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('d')
    //            ->andWhere('d.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('d.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Downloadables
    //    {
    //        return $this->createQueryBuilder('d')
    //            ->andWhere('d.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
